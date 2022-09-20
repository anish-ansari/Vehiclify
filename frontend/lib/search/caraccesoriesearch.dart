import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehiclify/model/caraccesorie.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';

class CarAccessorieSearch extends SearchDelegate{


  List<CarAccesorie> boo;

  CarAccessorieSearch(this.boo);

  bool isLoading = true;

  navigateTolink(url) async
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
        element.vendorname.toString().toLowerCase().startsWith(query))
        .toList();

    return query.isEmpty
        ? Center(
        child: Text("Search Vendor"))
        : suggestionList.isEmpty
        ? Center(child: Text("No vendor found"))
        : ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(
                    "Vendor Name: ${suggestionList[index].vendorname}"),
              onTap:()=>navigateTolink("${suggestionList[index].linkc}"),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return query.isEmpty
        ? Center(
        child: Text("Search Vendor"))
        : buildResults(context);

  }
}