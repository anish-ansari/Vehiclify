import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:vehiclify/model/bikecategory.dart';
import 'dart:convert';
import 'package:vehiclify/model/bikemarketmodel.dart';
import 'package:vehiclify/network_utils/ipaddress.dart';

class BikeMarket extends StatefulWidget {
  @override
  _BikeMarketState createState() => _BikeMarketState();
}

class _BikeMarketState extends State<BikeMarket> {
  bool isLoading=false;

  String url = "http://${Server.ipAddress}/vehiclify/public/api/bikecategorys";

//  String url = "http://${Server.ipAddress}/public/api/rules";

  Future<List<BikeCategory>> fetchRule() async {
    try {
      final response = await http.get(url);
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
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
        automaticallyImplyLeading: false,
        title: Text("Bike Market"),
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
                                BikeMarketPage(rule[index].id, rule[index].bikecatname)));
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


class BikeMarketPage extends StatefulWidget {

  final String categoryName;
  final int categoryId;
  BikeMarketPage(this.categoryId, this.categoryName);


  @override
  _BikeMarketPageState createState() => _BikeMarketPageState();
}

class _BikeMarketPageState extends State<BikeMarketPage> {

  String id;

  bool isLoading = false;

  Future<List<BikeMarketModel>> getProductsByCategoryId(String id) async{
    var products = await http.get("http://${Server.ipAddress}/vehiclify/public/api/get-bikemarkets-by-category/${this.widget.categoryId}");

    var notes = List<BikeMarketModel>();

    if(products.statusCode ==200){
      var _list = json.decode(products.body);
      for(var noteJson in _list){
        notes.add(BikeMarketModel.fromJson(noteJson));
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

  List<BikeMarketModel> _productListByCategory = List<BikeMarketModel>();


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
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                BikeMarketDetailPage(_productListByCategory[index])));
                  },
                  child: ListTile(
                    title: Text("•  ${_productListByCategory[index].vbname}"),


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



class BikeMarketDetailPage extends StatelessWidget {

  final BikeMarketModel ba;

  BikeMarketDetailPage(this.ba);


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
              "${ba.vbname}",
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
                  child: Image.network(ba.vbimage),
                ),
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: ListTile(
              title: Text('Varient',style: TextStyle(
                  fontSize: 20.0,fontWeight: FontWeight.w600
              ),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(ba.vbvarient),
              ),
            ),
          ),
        ],
      ),

    );
  }
}







