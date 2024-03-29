import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:vehiclify/model/todo_model.dart';

class DatabaseConnect{
  Database _database;

  Future<Database> get database async{
    final dbpath  = await getDatabasesPath();

    const dbname  = 'todo.db';

    final path = join(dbpath,dbname);

    _database = await openDatabase(path, version:1, onCreate:_createDB);

    return _database;

  }

   Future<void> _createDB(Database db, int version) async{
    await db.execute('''
        CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        creationDate TEXT,
        isChecked INTEGER)
      ''');
   }

   Future<void> insertTodo(Todo todo) async{
    final db = await database;

    await db.insert('todo',
        todo.toMap(),
        conflictAlgorithm:  ConflictAlgorithm.replace,
    );
   }

   Future<void> deleteTodo(Todo todo) async{
    final db = await database;
    await db.delete('todo', where: 'id == ?',
      whereArgs: [todo.id],
    );
   }

   Future<List<Todo>> getTodo() async{

    final db = await database;

    List<Map<String,dynamic>>  items = await db.query('todo',
      orderBy:  'id DESC'

    );

    return List.generate(items.length,
            (i)=> Todo(id: items[i]['id'],
                title: items[i]['title'],
                creationDate: DateTime.parse(items[i]['creationDate']),
                isChecked: items[i]['isChecked'] == 1 ? true : false,
            ));

  }

}