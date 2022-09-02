import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:vehiclify/model/bikecategory.dart';
import 'dart:convert';
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
//                    Navigator.push(
//                        context,
//                        new MaterialPageRoute(
//                            builder: (context) =>
//                                BikeServicePage(rule[index].id, rule[index].bikecatname)));
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

