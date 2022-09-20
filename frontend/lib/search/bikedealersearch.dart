

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehiclify/model/bikedealer.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';


class BikeDealerSearch extends SearchDelegate{


  List<BikeDealer> boo;

  BikeDealerSearch(this.boo);

  bool isLoading = true;

  navigateTophone(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  navigateTolocation(url) async
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
    element.bikedelname.toString().toLowerCase().startsWith(query)||
        element.bikedeladdress.toString().toLowerCase().startsWith(query)).toList();

    return query.isEmpty
        ? Center(
        child: Text("Search Dealer"))
        : suggestionList.isEmpty
        ? Center(child: Text("No dealer found"))
        : ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            color: Colors.white,
            child: ListTile(
              leading: IconButton(icon: Icon(Icons.call),
                onPressed: ()=>navigateTophone("tel:${suggestionList[index].bikedelphoneno}") ,
              ),
              title: Text("•  ${suggestionList[index].bikedelname}"),
              subtitle: Text("${suggestionList[index].bikedeladdress}"),
              trailing: IconButton(icon: Icon(Icons.location_on),
                onPressed: ()=>navigateTolocation("${suggestionList[index].bikedellocation}") ,
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
        child: Text("Search Dealer"))
        : buildResults(context);

  }
}