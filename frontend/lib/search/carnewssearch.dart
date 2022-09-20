import 'package:flutter/material.dart';
import 'package:vehiclify/model/car.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:vehiclify/pages/carnews.dart';


class CarNewsSearch extends SearchDelegate{

  List<Car> boo;

  CarNewsSearch(this.boo);

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
        element.ctitle.toString().toLowerCase().startsWith(query))
        .toList();

    return query.isEmpty
        ? Center(
        child: Text("Search Car News"))
        : suggestionList.isEmpty
        ? Center(child: Text("No car news found"))
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
                              CarDetail(suggestionList[index])));
                },
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: ListTile(
                    title: Text("•  ${suggestionList[index].ctitle}"),


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
        child: Text("Search Car News"))
        : buildResults(context);

  }
}