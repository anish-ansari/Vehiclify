import 'package:flutter/material.dart';


class CarMarket extends StatefulWidget {
  @override
  _CarMarketState createState() => _CarMarketState();
}

class _CarMarketState extends State<CarMarket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Market"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
