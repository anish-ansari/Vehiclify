import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiclify/model/nearby.dart';
import 'dart:convert';
import 'package:vehiclify/network_utils/ipaddress.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:url_launcher/url_launcher.dart';


class NearbyPage extends StatefulWidget {
  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {


  navigateTonearby(url) async
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

  String url = "http://${Server.ipAddress}/vehiclify/public/api/nearbys";

//  String url = "http://${Server.ipAddress}/public/api/rules";

  Future<List<Nearby>> fetchRule() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      token = jsonDecode(localStorage.getString('token'))['token'];
      final response = await http.get(url,headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        List<Nearby> rule = parseRequestRules(response.body);
        return rule;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<Nearby> parseRequestRules(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    {
      return parsed
          .map<Nearby>((json) => Nearby.fromJson(json))
          .toList();
    }
  }

  List<Nearby> rule = List();

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
          title: Text('Nearby'),
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
          child: rule.isEmpty ? Center(child: Text("No nearby found")) : ListView.builder (
            itemCount: rule == null ? 0 : rule.length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: <Widget>[
                  InkWell(
                    onTap:()=>navigateTonearby("${rule[index].linkn}"),
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: ListTile(
                        title: Text("•  ${rule[index].namen}"),


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
