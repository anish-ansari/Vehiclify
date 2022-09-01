import 'package:flutter/material.dart';
import 'package:vehiclify/model/db_model.dart';
import 'package:vehiclify/model/todo_model.dart';


class CarMarket extends StatefulWidget {
  @override
  _CarMarketState createState() => _CarMarketState();
}

class _CarMarketState extends State<CarMarket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Market"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: RaisedButton(
        child: Text('insert', style: TextStyle(fontSize: 20),),
        onPressed: () {_insert();},
      ),
    );
  }

  _insert() async{
      var db = DatabaseConnect();

  await db.insertTodo(Todo(
      id: 1,
      title: 'This is sample todo',
      creationDate: DateTime.now(),
      isChecked: false
  ));

  }
}