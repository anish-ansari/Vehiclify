import 'package:flutter/material.dart';

class BikeMarket extends StatefulWidget {
  @override
  _BikeMarketState createState() => _BikeMarketState();
}

class _BikeMarketState extends State<BikeMarket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bike Market"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),

    );
  }
}

