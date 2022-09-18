import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:vehiclify/pages/homepage.dart';
import 'package:vehiclify/pages/licenseimage.dart';


class License extends StatefulWidget {
  @override
  _LicenseState createState() => _LicenseState();
}

class _LicenseState extends State<License> {

  int id;
  String name;
  String email;
  String phone;
  String dateofbirth;
  String address;
  String fathername;
  String citizenshipno;
  String licenseno;
  String licenseoffice;
  String dateofissue;
  String dateofexpiry;
  String category;
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
  String verify;

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        id = user['id'];
        licenseno = user['licenseno'];
        licenseoffice = user['licenseoffice'];
        dateofissue = user['dateofissue'];
        dateofexpiry = user['dateofexpiry'];
        category = user['category'];
        verify = user['verify'];

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
        title: Text('License'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.credit_card),
            onPressed: (){
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => LicenseImage()));
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),

      body: Center(
        child: Container(
          child: QrImage(
            data: 'License Information\n\n'
                'id: $id\n\n'
                'verify: $verify\n\n'
                'License No: $licenseno\n\n'
                'Licnese office: $licenseoffice\n\n'
                'Issue Date: $dateofissue\n\n'
                'Expiry Date: $dateofexpiry\n\n'
                'Category: $category\n\n\n',
            version: QrVersions.auto,
            size: 200,

          ),
        ),
      ),
    );
  }
}
