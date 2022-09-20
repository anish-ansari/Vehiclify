import 'package:flutter/material.dart';
import 'package:vehiclify/model/carmarketmodel.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:vehiclify/pages/carmarket.dart';



class CarMarketSearch extends SearchDelegate{


  List<CarMarketModel> boo;

  CarMarketSearch(this.boo);

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
    element.vcname.toString().toLowerCase().startsWith(query)).toList();

    return query.isEmpty
        ? Center(
        child: Text("Search car model"))
        : suggestionList.isEmpty
        ? Center(child: Text("No model found"))
        : ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Card(
                elevation: 5,
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                CarMarketDetailPage(suggestionList[index])));
                  },
                  child: ListTile(
                    title: Text("•  ${suggestionList[index].vcname}"),


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
        child: Text("Search Bike Model"))
        : buildResults(context);

  }
}