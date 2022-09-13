import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';


class Exam extends StatefulWidget {
  @override
  _ExamState createState() => _ExamState();
}

class _ExamState extends State<Exam> {



  navigateToaclass(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  navigateTobclass(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  navigateTocartrial(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  navigateTobiketrial(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }






  navigateToexam(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url,forceSafariVC: true, forceWebView: true);
    }
    else {
      Text('Link is not Working $url');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
        automaticallyImplyLeading: false,
        title: Text("License Exam info"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),

      backgroundColor: Colors.white,
      body: Container(
            padding: EdgeInsets.all(30.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[

                Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),

                  child: InkWell(
//
                    onTap: ()=>navigateToaclass("https://drive.google.com/file/d/1D9UBJLsIMfGaGJRrxwlR6Q_R1DSX8Mgw/view"),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                              iconSize: 60,
                              alignment: Alignment.topCenter,
                              icon: Icon(Icons.question_answer)),
                          Text(
                            'A/K Class\nQuestion',
                            style: new TextStyle(fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),

                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()=>navigateTobclass("https://drive.google.com/file/d/1S_E-yU96K0Qte7lwk1ATWNQWnQonrFbo/view"),
                     child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                              iconSize: 60,
                              alignment: Alignment.topCenter,
                              icon: Icon(
                                  Icons.question_answer
                              )),
                          Text(
                            'B Class\nQuestion',
                            style: new TextStyle(fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),

                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()=> navigateTocartrial("https://www.youtube.com/watch?v=lmxpsKbhwZE"),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                              iconSize: 60,
                              alignment: Alignment.topCenter,
                              icon: Icon(
                                  Icons.grid_on
                              )),
                          Text(
                            'Car Trial',
                            style: new TextStyle(fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),

                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () =>  navigateTobiketrial("https://www.youtube.com/watch?v=SBDGCRCpgNY"),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                              iconSize: 60,
                              alignment: Alignment.topCenter,
                              icon: Icon(
                                  Icons.grid_on
                              )),
                          Text(
                            'Bike Trial',
                            style: new TextStyle(fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),

                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()=>navigateToexam("https://www.nepallicense.com/exam-detail"),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                              iconSize: 60,
                              alignment: Alignment.topCenter,
                              icon: Icon(
                                  Icons.library_books
                              )
                          ),
                          Text(
                            'Prepare Exam\nNepal License',
                            style: new TextStyle(fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),


    );
  }
}
