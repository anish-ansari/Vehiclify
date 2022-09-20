import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vehiclify/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiclify/pages/welcome.dart';
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
        verify = user['verify'];

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
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(11.0,0.0,0.0,0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80, //80% of width,
                  child: Text("Personal Detail\n\n Verify:$verify",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Column(
                children: [
                  //row for each deatails
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("$name"),
                  ),
                  Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("$email"),
                  ),
                  Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("$phone"),
                  ),
                  Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text("$dateofbirth"),
                  ),
                  Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text("$address"),
                  ),
                  Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: Icon(Icons.face),
                    title: Text("$fathername"),
                  ),
                  Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text("$citizenshipno"),
                  )
                ],
              ),
            ),
          ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(11.0,0.0,0.0,0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80, //80% of width,
                  child: Text("License Information",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      //row for each deatails
                      ListTile(
                        leading: Icon(Icons.border_color),
                        title: Text("$licenseno"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.business),
                        title: Text("$licenseoffice"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text("$dateofissue"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text("$dateofexpiry"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.category),
                        title: Text("$category"),
                      ),

                    ],
                  ),
                ),
              ),SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(11.0,0.0,0.0,0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80, //80% of width,
                  child: Text("Bluebook information",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      //row for each deatails
                      ListTile(
                        leading: Icon(Icons.business),
                        title: Text("$companyname"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.directions_car),
                        title: Text("$model"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_view_day),
                        title: Text("$manufacturedyear"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.move_to_inbox),
                        title: Text("$cylinder"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.build),
                        title: Text("$cc"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.web_asset),
                        title: Text("$chasisno"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.surround_sound),
                        title: Text("$engineno"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.local_car_wash),
                        title: Text("$color"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.airline_seat_recline_extra),
                        title: Text("$seatcapacity"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.local_gas_station),
                        title: Text("$fueltype"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.transfer_within_a_station),
                        title: Text("$boughtfrom"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.my_location),
                        title: Text("$use"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.not_listed_location),
                        title: Text("$drivingarea"),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.date_range),
                        title: Text("$renewdate"),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  elevation: 10,
                  onPressed: (){
                    logout();
//                    Navigator.pushReplacement(
//                        context,
//                        MaterialPageRoute(builder: (context)=>Welcome()));
                  },
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text('Logout',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
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
          MaterialPageRoute(builder: (context)=>Welcome()));
    }
  }
}