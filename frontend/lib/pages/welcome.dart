import 'package:flutter/material.dart';
import 'package:vehiclify/pages/login.dart';



class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//        title: Text('Sign in/up'),
//        backgroundColor: Colors.brown[400],
//      ),
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset("assets/images/phone.png"),
          ),
          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('Vehiclify',style: TextStyle(fontSize: 25,color: Colors.grey),textAlign: TextAlign.center,),),
          SizedBox(height: 20.0),

          SizedBox(
            height: 50.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(),fullscreenDialog: true));
              },
              color: Colors.grey,
              child: Text('Get Started',style: TextStyle(color: Colors.white70,fontSize: 20.0),),

            ),
          ),
        ],
      ),
    );
  }
}
