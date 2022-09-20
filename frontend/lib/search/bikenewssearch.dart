import 'package:flutter/material.dart';
import 'package:vehiclify/model/bike.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:vehiclify/pages/bikenews.dart';


class BikeNewsSearch extends SearchDelegate{

  List<Bike> boo;

  BikeNewsSearch(this.boo);

  bool isLoading = true;



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
        element.btitle.toString().toLowerCase().startsWith(query))
        .toList();

    return query.isEmpty
        ? Center(
        child: Text("Search Bike News"))
        : suggestionList.isEmpty
        ? Center(child: Text("No bike news found"))
        : ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              BikeDetail(suggestionList[index])));
                },
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: ListTile(
                    title: Text("•  ${suggestionList[index].btitle}"),


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
        child: Text("Search Bike News"))
        : buildResults(context);

  }
}