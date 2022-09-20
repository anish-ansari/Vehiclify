import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:vehiclify/model/carcategory.dart';
import 'package:vehiclify/model/cardealer.dart';
import 'package:vehiclify/model/bikecategory.dart';
import 'package:vehiclify/model/bikedealer.dart';
import 'dart:convert';
import 'package:vehiclify/network_utils/ipaddress.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehiclify/search/bikedealersearch.dart';
import 'package:vehiclify/search/cardealersearch.dart';


class Dealer extends StatefulWidget {
  @override
  _DealerState createState() => _DealerState();
}

class _DealerState extends State<Dealer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
        automaticallyImplyLeading: false,
        title: Text('Dealer'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightBlue,
            actions: <Widget>[],
            title: new TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
              indicatorPadding: EdgeInsets.all(30),
              isScrollable: false,
              indicatorColor: Colors.white,
              indicatorWeight: 12.0,

              tabs: [
                new Tab( icon: Icon(Icons.directions_car), text: 'Car', ),
                new Tab(icon: Icon(Icons.directions_bike),  text: 'Bike', ),
              ],
              // indicatorColor: Colors.white,
            ),
          ),
          body: new TabBarView(
            children: [
              CarDelCat(),
              BikeDelCat(),
            ],
          ),
        ),
      ),
    );
  }
}



class CarDelCat extends StatefulWidget {
  @override
  _CarDelCatState createState() => _CarDelCatState();
}

class _CarDelCatState extends State<CarDelCat> {
  bool isLoading=false;
  var token;

  String url = "http://${Server.ipAddress}/vehiclify/public/api/carcategorys";

//  String url = "http://${Server.ipAddress}/public/api/rules";

  Future<List<CarCategory>> fetchRule() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      token = jsonDecode(localStorage.getString('token'))['token'];
      final response = await http.get(url,headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        List<CarCategory> rule = parseRequestRules(response.body);
        return rule;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<CarCategory> parseRequestRules(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    {
      return parsed
          .map<CarCategory>((json) => CarCategory.fromJson(json))
          .toList();
    }
  }

  List<CarCategory> rule = List();

  @override
  void initState() {
    super.initState();
    isLoading = true;
    fetchRule().then((rulesFromServer) {
      setState(() {
        isLoading = false;
        rule = rulesFromServer;
      });
    });
  }

  Future<void> _getData() async {
    setState(() {
      fetchRule();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  isLoading ?  Center(
          child: CircularProgressIndicator(),
        ):  RefreshIndicator(
          onRefresh: _getData,
          child: rule.isEmpty
              ? Center(child: Text("No category found"))
              : GridView.builder(
            itemCount: rule == null ? 0 : rule.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemBuilder: (BuildContext context, index) {
              return Column(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                CarDealerPage(rule[index].id, rule[index].carcatname)));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 100,
                          child: Image.network(
                            rule[index].carcaticon,

                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Column(children:[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(rule[index].carcatname),
                          ),
                        ])

                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                ),
              ]);
            },
          ),
        )

    );
  }
}




class CarDealerPage extends StatefulWidget {



  final String categoryName;
  final int categoryId;
  CarDealerPage(this.categoryId, this.categoryName);



  @override
  _CarDealerPageState createState() => _CarDealerPageState();
}

class _CarDealerPageState extends State<CarDealerPage> {

  navigateTocardealerphone(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  navigateTocardealerlocation(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }



  String id;

  bool isLoading = false;
  var token;

  Future<List<CarDealer>> getProductsByCategoryId(String id) async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
    var products = await http.get("http://${Server.ipAddress}/vehiclify/public/api/get-cardealers-by-category/${this.widget.categoryId}",headers: {
      'Authorization': 'Bearer $token',
    });

    var notes = List<CarDealer>();

    if(products.statusCode ==200){
      var _list = json.decode(products.body);
      for(var noteJson in _list){
        notes.add(CarDealer.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    // TODO: implement initState
    getProductsByCategoryId(id).then((value){
      setState(() {
        _productListByCategory.addAll(value);
      });
    });
    super.initState();

  }

  List<CarDealer> _productListByCategory = List<CarDealer>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                  context: context, delegate: CarDealerSearch(_productListByCategory));
            },
          )
        ],
        automaticallyImplyLeading: false,
        title: Text(widget.categoryName),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),


      backgroundColor: Colors.white,
//        body: Container(
//          child: Text('good'),
//        ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          :
      _productListByCategory.isEmpty ? Center(child: Text("No dealer found")) : ListView.builder (
        itemCount: _productListByCategory == null ? 0 : _productListByCategory.length,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: <Widget>[
              Card(
                elevation: 5,
                color: Colors.white,
                child: ListTile(
                  leading: IconButton(icon: Icon(Icons.call),
                    onPressed: ()=>navigateTocardealerphone("tel:${_productListByCategory[index].cardelphoneno}") ,
                  ),
                  title: Text("•  ${_productListByCategory[index].cardelname}"),
                  subtitle: Text("${_productListByCategory[index].cardeladdress}"),
                  trailing:IconButton(icon: Icon(Icons.location_on),
                    onPressed: ()=>navigateTocardealerlocation("${_productListByCategory[index].cardellocation}") ,
                  ),


                ),
              ),

            ],
          );
        },
      ),

    );
  }
}





class BikeDelCat extends StatefulWidget {
  @override
  _BikeDelCatState createState() => _BikeDelCatState();
}

class _BikeDelCatState extends State<BikeDelCat> {

  bool isLoading=false;
  var token;

  String url = "http://${Server.ipAddress}/vehiclify/public/api/bikecategorys";

//  String url = "http://${Server.ipAddress}/public/api/rules";

  Future<List<BikeCategory>> fetchRule() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      token = jsonDecode(localStorage.getString('token'))['token'];
      final response = await http.get(url,headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        List<BikeCategory> rule = parseRequestRules(response.body);
        return rule;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<BikeCategory> parseRequestRules(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    {
      return parsed
          .map<BikeCategory>((json) => BikeCategory.fromJson(json))
          .toList();
    }
  }

  List<BikeCategory> rule = List();

  @override
  void initState() {
    super.initState();
    isLoading = true;
    fetchRule().then((rulesFromServer) {
      setState(() {
        isLoading = false;
        rule = rulesFromServer;
      });
    });
  }

  Future<void> _getData() async {
    setState(() {
      fetchRule();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  isLoading ?  Center(
          child: CircularProgressIndicator(),
        ):  RefreshIndicator(
          onRefresh: _getData,
          child: rule.isEmpty
              ? Center(child: Text("No category found"))
              : GridView.builder(
            itemCount: rule == null ? 0 : rule.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemBuilder: (BuildContext context, index) {
              return Column(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                BikeDealerPage(rule[index].id, rule[index].bikecatname)));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 100,
                          child: Image.network(
                            rule[index].bikecaticon,

                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Column(children:[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(rule[index].bikecatname),
                          ),
                        ])

                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                ),
              ]);
            },
          ),
        )

    );
  }
}


class BikeDealerPage extends StatefulWidget {

  final String categoryName;
  final int categoryId;
  BikeDealerPage(this.categoryId, this.categoryName);

  @override
  _BikeDealerPageState createState() => _BikeDealerPageState();
}

class _BikeDealerPageState extends State<BikeDealerPage> {


  navigateTobikedealerphone(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  navigateTobikedealerlocation(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }


  String id;

  bool isLoading = false;
  var token;

  Future<List<BikeDealer>> getProductsByCategoryId(String id) async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
    var products = await http.get("http://${Server.ipAddress}/vehiclify/public/api/get-bikedealers-by-category/${this.widget.categoryId}",headers: {
      'Authorization': 'Bearer $token',
    });

    var notes = List<BikeDealer>();

    if(products.statusCode ==200){
      var _list = json.decode(products.body);
      for(var noteJson in _list){
        notes.add(BikeDealer.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    // TODO: implement initState
    getProductsByCategoryId(id).then((value){
      setState(() {
        _productListByCategory.addAll(value);
      });
    });
    super.initState();

  }

  List<BikeDealer> _productListByCategory = List<BikeDealer>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                  context: context, delegate: BikeDealerSearch(_productListByCategory));
            },
          )
        ],
        automaticallyImplyLeading: false,
        title: Text(widget.categoryName),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),

      backgroundColor: Colors.white,
//        body: Container(
//          child: Text('good'),
//        ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          :
      _productListByCategory.isEmpty ? Center(child: Text("No service found")) : ListView.builder (
        itemCount: _productListByCategory == null ? 0 : _productListByCategory.length,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: <Widget>[
              Card(
                elevation: 5,
                color: Colors.white,
                child: ListTile(
                  leading: IconButton(icon: Icon(Icons.call),
                    onPressed: ()=>navigateTobikedealerphone("tel:${_productListByCategory[index].bikedelphoneno}") ,
                  ),
                  title: Text("•  ${_productListByCategory[index].bikedelname}"),
                  subtitle: Text("${_productListByCategory[index].bikedeladdress}"),
                  trailing: IconButton(icon: Icon(Icons.location_on),
                    onPressed: ()=>navigateTobikedealerphone("${_productListByCategory[index].bikedellocation}") ,
                  ),


                ),
              ),

            ],
          );
        },
      ),

    );
  }
}




