import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vehiclify/pages/login.dart';
import 'package:vehiclify/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
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
        name = user['name'];
        email = user['email'];
        phone = user['phone'];
        dateofbirth = user['dateofbirth'];
        address = user['address'];
        fathername = user['fathername'];
        citizenshipno = user['citizenshipno'];
        licenseno = user['licenseno'];
        licenseoffice = user['licenseoffice'];
        dateofissue = user['dateofissue'];
        dateofexpiry = user['dateofexpiry'];
        category = user['category'];
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
        automaticallyImplyLeading: false,
        title: Text('Vehiclify'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),

    body: Center(
      child: Container(
        child: QrImage(
          data: 'License Information\n\n'
              'License No: $licenseno\n\n'
              'Licnese office: $licenseno\n\n'
              'Issue Date: $dateofissue\n\n'
              'Expiry Date: $dateofexpiry\n\n'
              'Category:$category\n\n\n'
              'Bluebook Information\n\n'
              'Chasis no: $chasisno\n\n'
              'Engine no: $engineno\n\n'
              'Fuel Type: $fueltype\n\n'


              ,
          version: QrVersions.auto,
          size: 200,

        ),
      ),
    ),
    );
  }

//  void logout() async{
//    var res = await Network().getData('/logout');
//    var body = json.decode(res.body);
//    if(body['success']){
//      SharedPreferences localStorage = await SharedPreferences.getInstance();
//      localStorage.remove('user');
//      localStorage.remove('token');
//      Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context)=>Login()));
//    }
//  }
}