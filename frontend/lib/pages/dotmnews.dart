import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehiclify/model/dotm.dart';
import 'dart:convert';
import 'package:vehiclify/network_utils/ipaddress.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:vehiclify/search/dotmnewssearch.dart';




class DotmNewsPage extends StatefulWidget {
  @override
  _DotmNewsPageState createState() => _DotmNewsPageState();
}

class _DotmNewsPageState extends State<DotmNewsPage> {


  navigateToDotm(url) async
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

  String url = "http://${Server.ipAddress}/vehiclify/public/api/dotms";

//  String url = "http://${Server.ipAddress}/public/api/rules";

  Future<List<Dotm>> fetchRule() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      token = jsonDecode(localStorage.getString('token'))['token'];
      final response = await http.get(url,headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        List<Dotm> rule = parseRequestRules(response.body);
        return rule;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<Dotm> parseRequestRules(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    {
      return parsed
          .map<Dotm>((json) => Dotm.fromJson(json))
          .toList();
    }
  }

  List<Dotm> rule = List();

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
          title: Text('DOTM News'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(
                    context: context, delegate: DotmNewsSearch(rule));
              },
            ),
            IconButton(
              icon: Icon(Icons.account_balance),
              onPressed: ()=> navigateToDotm("https://dotm.gov.np/"),
            )
          ],
        ),

        backgroundColor: Colors.white,
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : RefreshIndicator(
          onRefresh: _getData,
          child: rule.isEmpty ? Center(child: Text("No dotm news found")) : ListView.builder (
            itemCount: rule == null ? 0 : rule.length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: <Widget>[
                  InkWell(
                  onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            DotmDetail(rule[index])));
              },
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: ListTile(
                        title: Text("•  ${rule[index].dtitle}"),


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



class DotmDetail extends StatelessWidget {
  final Dotm book;

  DotmDetail(this.book);

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
                "${book.dtitle}",
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
                    child: Image.network(book.dimage),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: ListTile(
                title: Text('Description',style: TextStyle(
                    fontSize: 20.0,fontWeight: FontWeight.w600
                ),),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text(book.ddescription),
                ),
              ),
            ),
          ],
        ),

    );
  }
}
