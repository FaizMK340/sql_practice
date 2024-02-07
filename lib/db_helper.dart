import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper{

  //Variables/Fields/Members
  static const dbName = "myDatabase.db";
  static const dbVersion = 1;
  static const dbTable = "myTable";
  static const columnId = 'id';
  static const columnName = 'name';

  //Constructor

  static final DatabaseHelper instance = DatabaseHelper();

  //Database Initialize

  static Database? _database;

  Future<Database?> get database async{
    _database = await initDB();
    return _database;
  }

  initDB() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path,version: dbVersion,onCreate: onCreate);
  }


  Future onCreate(Database db , int version) async{

    db.execute(
      '''
      CREATE TABLE $dbTable(
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL
      )
      '''
    );
  }

//Insert Data

  insertData(Map<String , dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(dbTable, row);
  }

// Read Data

  Future<List<Map<String , dynamic>>?> readData() async{
    Database? db = await instance.database;
    return await db?.query(dbTable);
}

//Update Data

Future<int?> updataData(Map<String,dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db?.update(dbTable, row, where: '$columnId = ?', whereArgs: [id]);
  }

// Delete Data
  Future<int?> deleteData(int id) async {
    Database? db = await instance.database;
    return await db?.delete(dbTable, where: '$columnId=?',whereArgs: [id]);
  }


























}



