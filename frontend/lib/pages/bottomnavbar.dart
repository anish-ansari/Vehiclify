import 'package:flutter/material.dart';
import 'package:vehiclify/pages/homepage.dart';
import 'package:vehiclify/pages/profile.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int _currentIndex=0;
  final List<Widget>_children=[
    Home(),
    Profile(),

  ];

  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap:  onTappedBar,

        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title:Text('Home',style: TextStyle(fontSize: 11.0),),
            //  backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title:Text('Profile',style: TextStyle(fontSize: 11.0),),
            //   backgroundColor: Colors.white
          ),
        ],
      ),
    );
  }
}
