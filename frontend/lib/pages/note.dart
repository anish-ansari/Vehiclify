import 'package:flutter/material.dart';
import 'package:vehiclify/model/todo_model.dart';
import 'package:vehiclify/pages/bottomnavbar.dart';
import 'package:vehiclify/model/db_model.dart';
import 'package:intl/intl.dart';

class Note extends StatefulWidget {

  Note({Key key}) : super(key: key);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {

  var db = DatabaseConnect();

  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {

    });
  }

  void deleteItem(Todo todo) async{
    await db.deleteTodo(todo);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
          },
        ),
        automaticallyImplyLeading: false,
        title: Text('Note'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: <Widget>[
//          Todolist(),

         Todolist(insertFunction: addItem , deleteFunction: deleteItem,),
         UserInput(insertFunction: addItem,),

        ],
      ),
    );
  }
}




class UserInput extends StatelessWidget {

  var textController = TextEditingController();
  final Function insertFunction;

  UserInput({this.insertFunction , Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//      color: Colors.white70,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: 'Add new note',
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: (){
              var myTodo =  Todo(title: textController.text,
                creationDate: DateTime.now(),
                isChecked: false,
              );
              insertFunction(myTodo);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25 , vertical:  18 ),
              child:  Text('Add', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),



          )
        ],
      ),
    );
  }
}



class TodoCard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;

  TodoCard({Key key, this.id, this.title, this.creationDate, this.isChecked, this.insertFunction, this.deleteFunction}) : super(key: key);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override


  Widget build(BuildContext context) {
    var anotherTodo = Todo(id: widget.id,title: widget.title, creationDate: widget.creationDate, isChecked: widget.isChecked );
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool value) {
                setState(() {
                  widget.isChecked = value;
                });
                anotherTodo.isChecked = value;

                widget.insertFunction(anotherTodo);
              },
//            value: false,
//              onChanged: (bool value) {},
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                SizedBox(height: 5,),
                Text(DateFormat('dd MMM yyyy - hh:mm aaa').format(widget.creationDate),
                  style: TextStyle(fontSize: 16,
                    color: Color(0xFF8F8F8F), fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              widget.deleteFunction(anotherTodo);
            },
            icon: Icon(Icons.close),
          )
        ],
      ),
    );
  }
}

class Todolist extends StatelessWidget {

  final Function insertFunction;
  final Function deleteFunction;

  var db = DatabaseConnect();
  Todolist({this.insertFunction, this.deleteFunction, Key key}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData:  [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          var data =  snapshot.data;
          var datalength = data.length;

          return datalength == 0 ?  Center(child: Text('no data'),
          ):ListView.builder(itemCount: datalength,
              itemBuilder: (context,i) => TodoCard(
                id: data[i].id,
                title: data[i].title,
                creationDate: data[i].creationDate,
                isChecked: data[i].isChecked,
                insertFunction: insertFunction,
                deleteFunction: deleteFunction,

              )
          );
        },
      ) ,
    );
  }
}



