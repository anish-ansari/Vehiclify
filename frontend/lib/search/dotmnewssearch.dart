
import 'package:flutter/material.dart';
import 'package:vehiclify/model/dotm.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:vehiclify/pages/dotmnews.dart';


class DotmNewsSearch extends SearchDelegate{

  List<Dotm> boo;

  DotmNewsSearch(this.boo);

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
        element.dtitle.toString().toLowerCase().startsWith(query))
        .toList();

    return query.isEmpty
        ? Center(
        child: Text("Search Dotm News"))
        : suggestionList.isEmpty
        ? Center(child: Text("No dotm news found"))
        : ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
         return  Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              DotmDetail(suggestionList[index])));
                },
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: ListTile(
                    title: Text("•  ${suggestionList[index].dtitle}"),


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
        child: Text("Search Dotm News"))
        : buildResults(context);

  }
}