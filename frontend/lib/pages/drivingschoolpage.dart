import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehiclify/model/drivingschool.dart';
import 'dart:convert';
import 'package:vehiclify/network_utils/ipaddress.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:url_launcher/url_launcher.dart';


class DrivingSchoolPage extends StatefulWidget {
  @override
  _DrivingSchoolPageState createState() => _DrivingSchoolPageState();
}

class _DrivingSchoolPageState extends State<DrivingSchoolPage> {


  navigateTodrivingphone(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  navigateTodrivinglocation(url) async
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

  String url = "http://${Server.ipAddress}/vehiclify/public/api/drivingschools";

//  String url = "http://${Server.ipAddress}/public/api/rules";

  Future<List<DrivingSchool>> fetchRule() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<DrivingSchool> rule = parseRequestRules(response.body);
        return rule;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<DrivingSchool> parseRequestRules(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    {
      return parsed
          .map<DrivingSchool>((json) => DrivingSchool.fromJson(json))
          .toList();
    }
  }

  List<DrivingSchool> rule = List();

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
        title: Text("Driving School"),
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
            : RefreshIndicator(
          onRefresh: _getData,
          child: rule.isEmpty ? Center(child: Text("No vendor found")) : ListView.builder (
            itemCount: rule == null ? 0 : rule.length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: <Widget>[
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: ListTile(
                      leading: IconButton(icon: Icon(Icons.call),
                        onPressed: ()=>navigateTodrivingphone("tel:${rule[index].drivingschoolphoneno}") ,
                      ),
                      title: Text("•  ${rule[index].drivingschoolname}"),
                      subtitle: Text("${rule[index].drivingschooladdress}"),
                      trailing: IconButton(icon: Icon(Icons.location_on),
                        onPressed: ()=>navigateTodrivinglocation("${rule[index].drivingschoollocation}") ,
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
