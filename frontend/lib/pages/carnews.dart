import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehiclify/model/fuel.dart';
import 'dart:convert';
import 'package:vehiclify/network_utils/ipaddress.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';




class CarNewsPage extends StatefulWidget {
  @override
  _CarNewsPageState createState() => _CarNewsPageState();
}

class _CarNewsPageState extends State<CarNewsPage> {

  bool isLoading=false;

  String url = "http://${Server.ipAddress}/vehiclify/public/api/fules";

//  String url = "http://${Server.ipAddress}/public/api/rules";

  Future<List<Fuel>> fetchRule() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Fuel> rule = parseRequestRules(response.body);
        return rule;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<Fuel> parseRequestRules(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    {
      return parsed
          .map<Fuel>((json) => Fuel.fromJson(json))
          .toList();
    }
  }

  List<Fuel> rule = List();

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
          title: Text('Car News'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),

        backgroundColor: Colors.white,
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : RefreshIndicator(
          onRefresh: _getData,
          child: rule.isEmpty ? Center(child: Text("No fuel detail found")) : Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              height: 150.0,
              child: ListView.builder (
                scrollDirection: Axis.horizontal,

                itemCount: rule == null ? 0 : rule.length,
                itemBuilder: (BuildContext context, index) {
//              return Column(
//                children: <Widget>[
//                  Card(
//                    elevation: 5,
//                    color: Colors.white,
//                    child: ListTile(
//                      title: Text("${rule[index].fuelname} : Rs ${rule[index].price}"),
//
//
//                    ),
//                  ),
//                ],
//              );
                  return Container(
                    width: 150.0,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Text("${rule[index].fuelname} \n\n Rs ${rule[index].price}",style: TextStyle(fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        )
    );
  }
}
