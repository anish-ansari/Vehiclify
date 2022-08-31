import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:vehiclify/pages/homepage.dart';


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
  @override
  void initState(){
    _loadUserData();
    super.initState();
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
