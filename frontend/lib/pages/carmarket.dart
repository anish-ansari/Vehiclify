import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehiclify/model/carmarketmodel.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:vehiclify/model/carcategory.dart';
import 'dart:convert';
import 'package:vehiclify/network_utils/ipaddress.dart';
import 'package:vehiclify/search/carmarketsearch.dart';


class CarMarket extends StatefulWidget {
  @override
  _CarMarketState createState() => _CarMarketState();
}

class _CarMarketState extends State<CarMarket> {

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
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
        automaticallyImplyLeading: false,
        title: Text("Car Market"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
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
                                CarMarketPage(rule[index].id, rule[index].carcatname)));
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


class CarMarketPage extends StatefulWidget {

  final String categoryName;
  final int categoryId;
  CarMarketPage(this.categoryId, this.categoryName);

  @override
  _CarMarketPageState createState() => _CarMarketPageState();
}

class _CarMarketPageState extends State<CarMarketPage> {


  String id;

  bool isLoading = false;
  var token;


  Future<List<CarMarketModel>> getProductsByCategoryId(String id) async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
    var products = await http.get("http://${Server.ipAddress}/vehiclify/public/api/get-carmarkets-by-category/${this.widget.categoryId}",headers: {
      'Authorization': 'Bearer $token',
    });

    var notes = List<CarMarketModel>();

    if(products.statusCode ==200){
      var _list = json.decode(products.body);
      for(var noteJson in _list){
        notes.add(CarMarketModel.fromJson(noteJson));
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

  List<CarMarketModel> _productListByCategory = List<CarMarketModel>();

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
                  context: context, delegate: CarMarketSearch(_productListByCategory));
            },
          ),
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
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                CarMarketDetailPage(_productListByCategory[index])));
                  },
                  child: ListTile(
                    title: Text("•  ${_productListByCategory[index].vcname}"),


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


class CarMarketDetailPage extends StatelessWidget {

  final CarMarketModel ca;

  CarMarketDetailPage(this.ca);

  navigateTobooknow(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${ca.vcname}",
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Container(
                  child: Image.network(ca.vcimage),
                ),
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                 Text('Dimension\n\nLength/Width/Height/WheelBase/\nGroundClearence',style: TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.w600),
                   overflow: TextOverflow.ellipsis,
                 ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(ca.vcdimension,style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(),
            SizedBox(
              height: 15,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Color',style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600 ),),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(ca.vccolor,style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(),
            SizedBox(
              height: 15,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Displacement: ${ca.vcdisplacement} cc',style: TextStyle(
                      fontSize: 16.0,fontWeight: FontWeight.w600 ),),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Power :${ca.vcpower} bhp',style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Torque :${ca.vctorque} Nm',style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Tyre :${ca.vctyre}',style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Transmission :${ca.vctransmission}',style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(
                height: 15,
              ),

              Divider(),
              SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Varient',style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(ca.vcvarient,style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),

              SizedBox(
                height: 15,
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Price',style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('${ca.vcprice} Lakh',style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),

              SizedBox(
                height: 15,
              ),


              Divider(),
              SizedBox(
                height: 30,
              ),

              ButtonTheme(

                minWidth: 200,
                  height: 50,

                  child: RaisedButton(
                    child: Text("Book Now",style: TextStyle(
                        color: Colors.white, fontSize: 18
                    ),),
                    color: Colors.lightBlue,
                    onPressed: ()=>navigateTobooknow("${ca.vcbooknow}") ,

                ),
              ),
              SizedBox(
                height: 30,
              ),


            ],
          ),
          ),
        ],
      ),

    );
  }
}




