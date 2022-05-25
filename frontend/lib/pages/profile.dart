import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vehiclify/pages/login.dart';
import 'package:vehiclify/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  String name;
  String email;
  String phone;
  String dateofbirth;
  String address;
  String fathername;
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
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$name',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text('$email',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text('$phone',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text('$dateofbirth',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text('$address',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text('$fathername',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Center(
              child: RaisedButton(
                elevation: 10,
                onPressed: (){
                  logout();
                },
                color: Colors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logout() async{
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Login()));
    }
  }
}