import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehiclify/model/fuel.dart';
import 'package:vehiclify/network_utils/ipaddress.dart';
import 'package:vehiclify/pages/bikeaccessories.dart';
import 'package:vehiclify/pages/bikenews.dart';
import 'package:vehiclify/pages/bluebook.dart';
import 'package:vehiclify/pages/caraccesories.dart';
import 'package:vehiclify/pages/carnews.dart';
import 'package:vehiclify/pages/dealer.dart';
import 'package:vehiclify/pages/dotmnews.dart';
import 'package:vehiclify/pages/drivingschoolpage.dart';
import 'package:vehiclify/pages/emi.dart';
import 'package:vehiclify/pages/exam.dart';
import 'package:vehiclify/pages/insurance.dart';
import 'package:vehiclify/pages/license.dart';
import 'package:vehiclify/pages/mileage.dart';
import 'package:vehiclify/pages/nearbypage.dart';
import 'package:vehiclify/pages/note.dart';
import 'package:vehiclify/pages/reminder.dart';
import 'package:vehiclify/pages/scanqr.dart';
import 'package:vehiclify/pages/service.dart';
import 'package:vehiclify/pages/vehicleage.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{



  navigateToesewa(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }



  navigateTosign(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  navigateTopenalty(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  navigateTopermit(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }



  bool isLoading=false;
  var token;


  String url = "http://${Server.ipAddress}/vehiclify/public/api/fules";

  Future<List<Fuel>> fetchfuel() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      token = jsonDecode(localStorage.getString('token'))['token'];
      final response = await http.get(url,headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        List<Fuel> fuel = parseRequestFuels(response.body);
        return fuel;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<Fuel> parseRequestFuels(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    {
      return parsed
          .map<Fuel>((json) => Fuel.fromJson(json))
          .toList();
    }
  }

  List<Fuel> fuel = List();

  @override
  void initState() {
    super.initState();
    isLoading = true;
    fetchfuel().then((fuelsFromServer) {
      setState(() {
        isLoading = false;
        fuel = fuelsFromServer;
      });
    });
  }

  Future<void> _getData() async {
    setState(() {
      fetchfuel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Vehiclify'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.calendar_today),
            onPressed: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new MyNoteScreen()));
            },
          ),
          IconButton(icon: Icon(Icons.near_me),
          onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new NearbyPage()));
          },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left : 10.0),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Text('Documents',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new License()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/license.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("License",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new BlueBook()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/carb.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("BlueBook",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new ScanQR()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/qr.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Scanner",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0),),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Text('Services & Rule',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new CarAccesoriePage()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/bcar.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Car Accesories",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new BikeAccesoriePage()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/bikeass.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Bike Acessories",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new InsurancePage()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/insurance.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Insurance",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),



                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new DrivingSchoolPage()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/driving.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Driving School",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new Exam()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/exam.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("License Info",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: ()=>navigateToesewa("https://esewa.com.np/#/make_payment/NP-ES-TVRS-GOVERNMENT-PAYMENT/Traffic%20Police%20Fine%20Payment"),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/fine.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Fine",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: ()=>navigateTosign("https://drive.google.com/file/d/11PVMOxW7yH7FXtjEM-A1sdcjryo-0wDK/view"),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/warning.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Traffic Sign",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: ()=>navigateTopenalty("https://drive.google.com/file/d/1Hp80d76jW8ueah8Zscgm0MXb7xHdU8hc/view?usp=sharing"),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/penalty.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Penalty",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: ()=>navigateTopermit("https://drive.google.com/file/d/1u7S-48aJnOjMRaBg7kQUuAAVNdKJtfTz/view?usp=sharing"),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/permission.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Permit",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),



                  Padding(padding: EdgeInsets.only(top: 25.0),),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Text('Fuel Prices',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Container(child:isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : RefreshIndicator(
                    onRefresh: _getData,
                    child: fuel.isEmpty ? Center(child: Text("No fuel detail found")) : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 150.0,
                        child: ListView.builder (
                          scrollDirection: Axis.horizontal,

                          itemCount: fuel == null ? 0 : fuel.length,
                          itemBuilder: (BuildContext context, index) {

                            return Container(
                              width: 150.0,
//                              child: Card(
//                                child: Column(
//                                  children: <Widget>[
//                                    Padding(
//                                      padding: const EdgeInsets.all(30.0),
//                                      child: Text("${fuel[index].fuelname}/L \n\n Rs ${fuel[index].price}",style: TextStyle(fontSize: 20),),
//                                    ),
//                                  ],
//                                ),
                              child: Table(
                                border: TableBorder.all(color: Colors.blueGrey),
                                children: [
                                  TableRow(
                                    children: [
                                      Center(child: Text("\n${fuel[index].fuelname}/L\n",style: TextStyle(fontSize: 20),))
                                    ]
                                  ),
                                  TableRow(
                                    children: [
                                      Center(child: Text("\nRs ${fuel[index].price}\n",style: TextStyle(fontSize: 20),))
                                    ]
                                  )
                                ],
                              ),

                            );
                          },
                        ),
                      ),
                    ),
                  )
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Text('Calculators',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new Mileage()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/mileage.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Mileage",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new Emi()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/accounting.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("EMI",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new VehicleAge()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/age.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Vehicle Age",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Text('Tools',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new Note()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/notep.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Note",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new Service()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/car.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Service Center",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new Dealer()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/cardealer.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Dealers",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Text('News',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new DotmNewsPage()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/nepal.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("DOTM",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new CarNewsPage()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/newscar.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Car",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new BikeNewsPage()));
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Container(
                                height: 130.0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                        child: Image(image: AssetImage("assets/images/bycicle.png"),height: 90,width: 90,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                                        child: Text("Bike",),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
