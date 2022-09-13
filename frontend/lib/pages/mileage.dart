import 'package:flutter/material.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';

class Mileage extends StatefulWidget {
  @override
  _MileageState createState() => _MileageState();
}

class _MileageState extends State<Mileage> {
  String _totalfuel = "";
  String _milegageperkm = "";
  String _perkmcost= "";

  final TextEditingController _fuelrateperliter = TextEditingController();
  final TextEditingController _totalfuelfilled = TextEditingController();
  final TextEditingController _totaltravelkm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
        automaticallyImplyLeading: false,
        title: Text('Mileage'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: _fuelrateperliter,
                            decoration: InputDecoration(
                                labelText: "Fuel Rate Per liter"
                            ),
                            keyboardType: TextInputType.number,

                          )
                      ),

                      Container(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: _totalfuelfilled,
                            decoration: InputDecoration(
                                labelText: "Total Fuel Filled amount"
                            ),
                            keyboardType: TextInputType.number,
                          )
                      ),

                      Container(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: _totaltravelkm,
                            decoration: InputDecoration(
                                labelText: "Total km travel"
                            ),
                            keyboardType: TextInputType.number,
                          )
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                              fit: FlexFit.loose,
                              child: FlatButton(
                                  onPressed: _handleCalculation,
                                  child: Text("Calculate"),
                                  color: Colors.lightBlue,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 24.0, right: 24.0)
                              )
                          ),
                          Flexible(
                              fit: FlexFit.loose,
                              child: FlatButton(
                                  onPressed: _clear,
                                  child: Text("Clear"),
                                  color: Colors.lightBlue,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 24.0, right: 24.0)
                              )
                          ),
                        ],
                      ),

                      Padding(padding: EdgeInsets.only(top: 10),),

                      emiResultsWidget(_totalfuel,_milegageperkm,_perkmcost)

                    ],
                  )
              )
          ),
        )
    );
  }

  void _clear(){
    _fuelrateperliter.text = "";
    _totalfuelfilled.text = "";
    _totaltravelkm.text = "";


  }

  void _handleCalculation() {


    double totfuel = 0.0;
    double ml = 0.0;
    double cost = 0.0;
    int fr = int.parse(_fuelrateperliter.text);
    int tf = int.parse(_totalfuelfilled.text);
    int km = int.parse(_totaltravelkm.text);

    totfuel =  tf/fr;

    ml = km/(tf/fr);

    cost = tf/km;

    _totalfuel = totfuel.toStringAsFixed(2);
    _milegageperkm = ml.toStringAsFixed(2);
    _perkmcost = cost.toStringAsFixed(2);

    setState(() {

    });
  }

  Widget emiResultsWidget(totalfuel,milegageperkm,perkmcost) {

    bool canShow = false;
    String _totalfuel = totalfuel;
    String _mileageperkm =  milegageperkm;
    String _perkmcost = perkmcost;

    if( _totalfuel.length > 0 && _mileageperkm.length>0 && _perkmcost.length>0) {
      canShow = true;
    }
    return
         Container(
            padding: EdgeInsets.only(left: 20,right: 20,top:10),
            child: canShow ? Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      children: <Widget>[

                        Center(
                          child: Text('Result',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                        ),

                        Padding(padding: EdgeInsets.only(top: 12.0),),

                        Row(
                          children: <Widget>[
                            Text("Total Fuel(L): ",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            Text('${_totalfuel} L',
                                style: TextStyle(
                                    fontSize:18.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Row(
                          children: <Widget>[
                            Text("Mileage Per Liter: ",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            Text('${_mileageperkm} Km/L',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                )
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Row(
                          children: <Widget>[
                            Text("1 KM (Per KM cost): ",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            Text('NRs ${_perkmcost}',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                )
                            )
                          ],
                        )



                      ]
                  ),
                ),
              ),
            ) : Container()
        );

  }
}