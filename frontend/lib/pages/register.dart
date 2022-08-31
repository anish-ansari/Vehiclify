import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vehiclify/network_utils/api.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:vehiclify/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiclify/pages/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var name;
  var email;
  var phone;
  var dateofbirth;
  var address;
  var fathername;
  var citizenshipno;
  var password;
  var licenseno;
  var licenseoffice;
  var dateofissue;
  var dateofexpiry;
  var category;
  var companyname;
  var model;
  var manufacturedyear;
  var cylinder;
  var cc;
  var chasisno;
  var engineno;
  var color;
  var seatcapacity;
  var fueltype;
  var boughtfrom;
  var use;
  var drivingarea;
  var renewdate;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      new Padding(padding: const EdgeInsets.all(20.0),
                        child: new Text('Register',style: TextStyle(fontSize: 25.0,color: Colors.grey),textAlign: TextAlign.center,),),
                      SizedBox(height: 20.0),

                         Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),

                                Center(
                                  child: Text("Personal Information",style: TextStyle(fontSize: 20, color: Colors.grey,),),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.insert_emoticon,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Full Name",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (fullname) {
                                    if (fullname.isEmpty) {
                                      return 'Please enter your full name';
                                    }
                                    name = fullname;
                                    return null;
                                  },
                                ),

                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (emailValue) {
                                    if (emailValue.isEmpty) {
                                      return 'Please enter email';
                                    }
                                    email = emailValue;
                                    return null;
                                  },
                                ),

                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Phone",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (phonenumber) {
                                    if (phonenumber.isEmpty) {
                                      return 'Please enter phone number';
                                    }
                                    phone = phonenumber;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Date of birth",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (datebirth) {
                                    if (datebirth.isEmpty) {
                                      return 'Please enter your date of birth';
                                    }
                                    dateofbirth = datebirth;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_balance,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Address",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (add) {
                                    if (add.isEmpty) {
                                      return 'Please enter your address';
                                    }
                                    address = add;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.face,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Father Name",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (fatherName) {
                                    if (fatherName.isEmpty) {
                                      return 'Please enter your father name';
                                    }
                                    fathername = fatherName;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.credit_card,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Citizenship No",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (ctzno) {
                                    if (ctzno.isEmpty) {
                                      return 'Please enter your citizenship no';
                                    }
                                    citizenshipno = ctzno;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.vpn_key,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (passwordValue) {
                                    if (passwordValue.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    password = passwordValue;
                                    return null;
                                  },
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                Center(
                                  child: Text("License Information",style: TextStyle(fontSize: 20, color: Colors.grey,),),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.calendar_view_day,
                                      color: Colors.grey,
                                    ),
                                    hintText: "License No",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (licno) {
                                    if (licno.isEmpty) {
                                      return 'Please enter your license no';
                                    }
                                    licenseno = licno;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.business,
                                      color: Colors.grey,
                                    ),
                                    hintText: "License office",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (licoffice) {
                                    if (licoffice.isEmpty) {
                                      return 'Please enter your license office';
                                    }
                                    licenseoffice = licoffice;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    ),
                                    hintText: "License issue date",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (licissue) {
                                    if (licissue.isEmpty) {
                                      return 'Please enter license issue date';
                                    }
                                    dateofissue = licissue;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    ),
                                    hintText: "License expiry date",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (licexpiry) {
                                    if (licexpiry.isEmpty) {
                                      return 'Please enter license expiry date';
                                    }
                                    dateofexpiry = licexpiry;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.category,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Category",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (cat) {
                                    if (cat.isEmpty) {
                                      return 'Please enter category';
                                    }
                                    category = cat;
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Center(
                                  child: Text("Bluebook Information",style: TextStyle(fontSize: 20 ,color: Colors.grey ),),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.directions_car,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Car Company Name",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (companyName) {
                                    if (companyName.isEmpty) {
                                      return 'Please enter car company name';
                                    }
                                    companyname= companyName;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.local_car_wash,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Car model",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (carmodel) {
                                    if (carmodel.isEmpty) {
                                      return 'Please enter car model';
                                    }
                                    model =  carmodel;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Car Maufacture year",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (manu) {
                                    if (manu.isEmpty) {
                                      return 'Please enter manufacture year';
                                    }
                                    manufacturedyear = manu;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.dock,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Cylinder",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (cyl) {
                                    if (cyl.isEmpty) {
                                      return 'Please enter cylinder';
                                    }
                                    cylinder = cyl;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.settings_cell,
                                      color: Colors.grey,
                                    ),
                                    hintText: "CC",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (cC) {
                                    if (cC.isEmpty) {
                                      return 'Please enter cc';
                                    }
                                    cc = cC;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.subway,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Chasis No",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (chasisNo) {
                                    if (chasisNo.isEmpty) {
                                      return 'Please enter chasis no';
                                    }
                                    chasisno = chasisNo;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.settings,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Engine No",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (eng) {
                                    if (eng.isEmpty) {
                                      return 'Please enter engine no';
                                    }
                                    engineno = eng;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.color_lens,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Color",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (col) {
                                    if (col.isEmpty) {
                                      return 'Please enter color';
                                    }
                                    color = col;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.airline_seat_recline_normal,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Seat Capacity",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (seat) {
                                    if (seat.isEmpty) {
                                      return 'Please enter seat capacity';
                                    }
                                    seatcapacity = seat;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.local_gas_station,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Fule Type",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (fuel) {
                                    if (fuel.isEmpty) {
                                      return 'Please enter fuel type';
                                    }
                                    fueltype = fuel;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.people,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Bought from",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (bought) {
                                    if (bought.isEmpty) {
                                      return 'Please enter bought from';
                                    }
                                    boughtfrom = bought;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.directions,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Use",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (ue) {
                                    if (ue.isEmpty) {
                                      return 'Please enter use';
                                    }
                                    use = ue;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.location_city,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Driving area",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (drive) {
                                    if (drive.isEmpty) {
                                      return 'Please enter driving area';
                                    }
                                    drivingarea = drive;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.date_range,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Renewed Date",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (ren) {
                                    if (ren.isEmpty) {
                                      return 'Please enter renew date';
                                    }
                                    renewdate = ren;
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: FlatButton(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 8, bottom: 8, left: 10, right: 10),
                                      child: Text(
                                        _isLoading? 'Proccessing...' : 'Register',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    color: Colors.lightBlue,
                                    disabledColor: Colors.blueGrey,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(20.0)),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _register();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),


                      Padding(
                        padding: const EdgeInsets.only(top: 20 , bottom: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            'Already Have an Account',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _register()async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'name':name,
      'email' : email,
      'phone': phone,
      'dateofbirth':dateofbirth,
      'address':address,
      'fathername':fathername,
      'citizenshipno': citizenshipno,
      'password': password,
      'licenseno':licenseno,
      'licenseoffice':licenseoffice,
      'dateofissue':dateofissue,
      'dateofexpiry':dateofexpiry,
      'category':category,
      'companyname':companyname,
      'model':model,
      'manufacturedyear':manufacturedyear,
      'cylinder':cylinder,
      'cc':cc,
      'chasisno':chasisno,
      'engineno':engineno,
      'color':color,
      'seatcapacity':seatcapacity,
      'fueltype':fueltype,
      'boughtfrom':boughtfrom,
      'use':use,
      'drivingarea':drivingarea,
      'renewdate':renewdate,



    };

    var res = await Network().authData(data, '/register');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => MyBottomNavigationBar()
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}