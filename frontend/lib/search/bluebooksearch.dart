import 'package:flutter/material.dart';
import 'package:vehiclify/model/dotmbluebook.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BluebookSearch extends SearchDelegate{


  List<DotmBluebook> boo;

  BluebookSearch(this.boo);

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
    element.dchasisno.toString().toLowerCase().startsWith(query))
        .toList();

    return query.isEmpty
        ? Center(
        child: Text("Search Bluebook"))
        : suggestionList.isEmpty
        ? Center(child: Text("No bluebook found"))
        : ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(
                    "Chasis No: ${suggestionList[index].dchasisno}"),
                subtitle: Text(
                    "Engine No: ${suggestionList[index].dengineno}"),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              ShareBluebookDetailPage(suggestionList[index])));
                }
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return query.isEmpty
        ? Center(
        child: Text("Search Bluebook"))
        : buildResults(context);

  }
}


class ShareBluebookDetailPage extends StatelessWidget {

  final DotmBluebook book;

  ShareBluebookDetailPage(this.book);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text("Chasis No: ${book.dchasisno}"),
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
      ),
      body: Center(
        child: Container(
          child: QrImage(
            data:
            'Bluebook Information\n\n'
                'Company Name: ${book.dcompanyname}\n\n'
                'Model: ${book.dmodel}\n\n'
                'Manufactured Year: ${book.dmanufacturedyear}\n\n'
                'Cylinder: ${book.dcylinder}\n\n'
                'CC: ${book.dcc}\n\n'
                'Chasis no: ${book.dchasisno}\n\n'
                'Engine no: ${book.dengineno}\n\n'
                'Seat Capacity: ${book.dseatcapacity}\n\n'
                'Fuel Type: ${book.dfueltype}\n\n'
                'Renew Date: ${book.drenewdate}\n\n',
            version: QrVersions.auto,
            size: 200,
          ),
        ),
      ),
    );
  }
}
