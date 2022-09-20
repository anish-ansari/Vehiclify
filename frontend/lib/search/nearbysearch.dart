import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehiclify/model/nearby.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';


class NearBySearch extends SearchDelegate{

  List<Nearby> boo;

  NearBySearch(this.boo);

  bool isLoading = true;


  navigateTonearby(url) async
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
    element.namen.toString().toLowerCase().startsWith(query))
       .toList();

    return query.isEmpty
        ? Center(
        child: Text("Search NearBy"))
        : suggestionList.isEmpty
        ? Center(child: Text("No nearby found"))
        : ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              InkWell(
                onTap:()=>navigateTonearby("${suggestionList[index].linkn}"),
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: ListTile(
                    title: Text("•  ${suggestionList[index].namen}"),


                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return query.isEmpty
        ? Center(
        child: Text("Search NearBy"))
        : buildResults(context);

  }
}