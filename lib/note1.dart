import 'package:flutter/material.dart';
import 'package:sql_practice/db_helper.dart';

class Note1 extends StatefulWidget {
  const Note1({super.key});

  @override
  State<Note1> createState() => _Note1State();
}

class _Note1State extends State<Note1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text('Sqflite Database'),
      ),
      body: Center(



        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async{
              await DatabaseHelper.instance.insertData({
                DatabaseHelper.columnName : "Faiz MK",
                DatabaseHelper.columnName: "Faiz Khan"

              });
            }, child:const  Text('Insert')),
            ElevatedButton(onPressed: () async{
              var read = await DatabaseHelper.instance.readData();
              print(read);
            }, child:const  Text('Read')),
            ElevatedButton(onPressed: () async{
              await DatabaseHelper.instance.updataData({
                DatabaseHelper.columnId: 1,
                DatabaseHelper.columnName: "Faiz Khan"
              });
            }, child:const  Text('Update')),
            ElevatedButton(onPressed: () async{
              DatabaseHelper.instance.deleteData(2);
            }, child:const  Text('Delete')),


          ],
        ),
      ),
    );
  }
}
