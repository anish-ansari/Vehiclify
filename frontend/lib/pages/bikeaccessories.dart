import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiclify/model/bikeaccesorie.dart';
import 'dart:convert';
import 'package:vehiclify/network_utils/ipaddress.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:vehiclify/pages/homepage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehiclify/search/bikeaccesoriesearch.dart';



class BikeAccesoriePage extends StatefulWidget {
  @override
  _BikeAccesoriePageState createState() => _BikeAccesoriePageState();
}

class _BikeAccesoriePageState extends State<BikeAccesoriePage> {

  navigateTolink(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }


  bool isLoading=false;
  var token;

  String url = "http://${Server.ipAddress}/vehiclify/public/api/bikeaccesories";

//  String url = "http://${Server.ipAddress}/public/api/rules";

  Future<List<BikeAccesorie>> fetchRule() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      token = jsonDecode(localStorage.getString('token'))['token'];
      final response = await http.get(url,headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        List<BikeAccesorie> rule = parseRequestRules(response.body);
        return rule;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<BikeAccesorie> parseRequestRules(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    {
      return parsed
          .map<BikeAccesorie>((json) => BikeAccesorie.fromJson(json))
          .toList();
    }
  }

  List<BikeAccesorie> rule = List();

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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(
                    context: context, delegate: BikeAccesorieSearch(rule));
              },
            )
          ],
          automaticallyImplyLeading: false,
          title: Text('Bike Accesories'),
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
          child: rule.isEmpty ? Center(child: Text("No vendor found")) : ListView.builder (
            itemCount: rule == null ? 0 : rule.length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: <Widget>[
                  InkWell(
                    onTap:()=>navigateTolink("${rule[index].linkb}"),
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: ListTile(
                        title: Text("•  ${rule[index].vendor}"),


                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        )
    );
  }
}
