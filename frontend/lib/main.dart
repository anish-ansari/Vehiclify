import 'package:flutter/material.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiclify/pages/welcome.dart';
import 'package:vehiclify/pages/notification.dart';

//void main() {
//
//  runApp(
//    MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: CheckAuth(),
//
//    ),
//  );
//}

//void main() {
//
//  runApp(
////    MaterialApp(
////      debugShowCheckedModeBanner: false,
////      home: CheckAuth(),
////
////    ),
//      App()
//  );
//}

void main() async{
  runApp(
      App()
  );
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init(); //
  await NotificationService().requestIOSPermissions(); //
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckAuth(),
    );
  }
}


//welcome ma maile homepage halyachu


class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = MyBottomNavigationBar();
    } else {
      child = Welcome();
    }
    return Scaffold(
      body: child,
    );
  }
}

