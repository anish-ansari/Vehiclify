import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vehiclify/pages/bluebookimage.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:vehiclify/model/dotmbluebook.dart';
import 'package:vehiclify/network_utils/ipaddress.dart';
import 'package:vehiclify/search/bluebooksearch.dart';



class BlueBook extends StatefulWidget {
  @override
  _BlueBookState createState() => _BlueBookState();
}

class _BlueBookState extends State<BlueBook> {
  String companyname;
  String model;
  String manufacturedyear;
  String cylinder;
  String cc;
  String chasisno;
  String engineno;
  String color;
  String seatcapacity;
  String fueltype;
  String boughtfrom;
  String use;
  String drivingarea;
  String renewdate;

  bool isLoading = false;

  String url1 =
      "http://${Server.ipAddress}/vehiclify/public/api/dotmbluebooks";

  Future<List<DotmBluebook>> fetchBook() async {
    try {
      final response = await http.get(url1);
      if (response.statusCode == 200) {
        List<DotmBluebook> book = parseRequestBooks(response.body);
        return book;
      } else {
        failed();
        throw Exception("error");
      }
    } catch (e) {
      failed();
      throw Exception(e.toString());
    }
  }

  void failed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Could not load "),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<DotmBluebook> parseRequestBooks(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    {
      return parsed.map<DotmBluebook>((json) => DotmBluebook.fromJson(json)).toList();
    }
  }

  List<DotmBluebook> book = List();


  @override
  void initState(){
    _loadUserData();
    super.initState();
    isLoading = true;
    fetchBook().then((booksFromServer) {
      setState(() {
        isLoading = false;
        book = booksFromServer;
      });
    });
  }



  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if(user != null) {
      setState(() {
        companyname = user['companyname'];
        model = user['model'];
        manufacturedyear = user['manufacturedyear'];
        cylinder = user['cylinder'];
        cc = user['cc'];
        color = user['color'];
        chasisno = user['chasisno'];
        engineno = user['engineno'];
        seatcapacity = user['seatcapacity'];
        fueltype = user['fueltype'];
        boughtfrom = user['boughtfrom'];
        use = user['use'];
        drivingarea = user['drivingarea'];
        renewdate = user['renewdate'];
      });
    }
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
        title: Text('BlueBook'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.book),
            onPressed: (){
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => BlueBookImage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                  context: context, delegate: BluebookSearch(book));
            },
          )
        ],
        backgroundColor: Colors.lightBlue,
      ),

      body: Center(
        child: Container(
          child: QrImage(
            data:
                'Bluebook Information\n\n'
                'Company Name: $companyname\n\n'
                'Model: $model\n\n'
                'Manufactured Year: $manufacturedyear\n\n'
                'Cylinder: $cylinder\n\n'
                'CC: $cc\n\n'
                'Chasis no: $chasisno\n\n'
                'Engine no: $engineno\n\n'
                'Seat Capacity: $seatcapacity\n\n'
                'Fuel Type: $fueltype\n\n'
                'Renew Date: $renewdate\n\n',
            version: QrVersions.auto,
            size: 200,
          ),
        ),
      ),
    );
  }
}
