import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:vehiclify/model/carcategory.dart';
import 'package:vehiclify/model/carservice.dart';
import 'dart:convert';
import 'package:vehiclify/network_utils/ipaddress.dart';


class Service extends StatefulWidget {
  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
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
        title: Text('Service'),
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
              CarSerCat(),
              BikeSerCat(),
            ],
          ),
        ),
      ),
    );
  }
}


class CarSerCat extends StatefulWidget {
  @override
  _CarSerCatState createState() => _CarSerCatState();
}

class _CarSerCatState extends State<CarSerCat> {
  bool isLoading=false;

  String url = "http://${Server.ipAddress}/vehiclify/public/api/carcategorys";

//  String url = "http://${Server.ipAddress}/public/api/rules";

  Future<List<CarCategory>> fetchRule() async {
    try {
      final response = await http.get(url);
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
                                CarServicePage(rule[index].id, rule[index].carcatname)));
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



class BikeSerCat extends StatefulWidget {
  @override
  _BikeSerCatState createState() => _BikeSerCatState();
}

class _BikeSerCatState extends State<BikeSerCat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Bike'),
    );
  }
}


class CarServicePage extends StatefulWidget {


//  final CarCategory cat;
  final String categoryName;
  final int categoryId;

  CarServicePage(this.categoryId, this.categoryName);



  @override
  _CarServicePageState createState() => _CarServicePageState();
}

class _CarServicePageState extends State<CarServicePage> {
  


  String id;


//  String url = "http://${Server.ipAddress}/public/api/rules";

  bool isLoading = false;



  Future<List<CarService>> getProductsByCategoryId(String id) async{
    var products = await http.get("http://${Server.ipAddress}/vehiclify/public/api/get-carsevices-by-category/${this.widget.categoryId}");

    var notes = List<CarService>();


    if(products.statusCode ==200){
      var _list = json.decode(products.body);
      for(var noteJson in _list){
        notes.add(CarService.fromJson(noteJson));
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


  List<CarService> _productListByCategory = List<CarService>();




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
                        title: Text("•  ${_productListByCategory[index].carsername}"),


                      ),
                    ),

                ],
              );
            },
          ),

    );
  }
}


