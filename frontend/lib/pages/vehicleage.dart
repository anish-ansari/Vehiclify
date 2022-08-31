import 'package:flutter/material.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';

class VehicleAge extends StatefulWidget {
  @override
  _VehicleAgeState createState() => _VehicleAgeState();
}

class _VehicleAgeState extends State<VehicleAge> {
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
        title: Text('Vehicle Age'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Column(

        ),
      ),
    );
  }
}
