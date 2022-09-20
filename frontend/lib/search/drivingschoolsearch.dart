import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehiclify/model/drivingschool.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';


class DrivingSchoolSearch extends SearchDelegate{

  List<DrivingSchool> boo;

  DrivingSchoolSearch(this.boo);

  bool isLoading = true;


  navigateTodrivingphone(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  navigateTodrivinglocation(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }





  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }


  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    final suggestionList = query.isEmpty
        ? boo
        : boo
        .where((element) =>
        element.drivingschoolname.toString().toLowerCase().startsWith(query)||
    element.drivingschooladdress.toString().toLowerCase().startsWith(query)).toList();

    return query.isEmpty
        ? Center(
        child: Text("Search Driving School"))
        : suggestionList.isEmpty
        ? Center(child: Text("No driving school found"))
        : ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            color: Colors.white,
            child: ListTile(
              leading: IconButton(icon: Icon(Icons.call),
                onPressed: ()=>navigateTodrivingphone("tel:${suggestionList[index].drivingschoolphoneno}") ,
              ),
              title: Text("•  ${suggestionList[index].drivingschoolname}"),
              subtitle: Text("${suggestionList[index].drivingschooladdress}"),
              trailing: IconButton(icon: Icon(Icons.location_on),
                onPressed: ()=>navigateTodrivinglocation("${suggestionList[index].drivingschoollocation}") ,
              ),
            ),
          );

        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return query.isEmpty
        ? Center(
        child: Text("Search Driving School"))
        : buildResults(context);

  }
}