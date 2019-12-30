import 'package:flutter/material.dart';
import 'package:school/models/student.dart';
import 'package:school/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'Works.dart';
class Mark extends StatefulWidget {
  @override
  _MarkState createState() => _MarkState();
}

class _MarkState extends State<Mark> {
    Student student = Student();
  DatabaseHelper databaseHelper = DatabaseHelper();
 Student target = Student();
  List<Student> studentList;
 final _arabic = TextEditingController();
 final _english = TextEditingController();
 final _math = TextEditingController();
 final _second = TextEditingController();
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    setState(() {
       if (studentList == null) {
          studentList = List<Student>();
          updateListView();
        }
         for (int i = 0; i < _count; i++) {
          if (idtarget == studentList[i].id) {
            target = studentList[i];
          }
        }
    });
      
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            updateListView();
            
          });
        },
      ),
        body: Stack(
          children: <Widget>[
            
            ListView(
              children: <Widget>[
                Padding(
              padding: const EdgeInsets.all(50.0),
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text(
                    'Course',
                    style: TextStyle(fontSize: 30),
                  )),
                  DataColumn(
                      label: Text(
                    'Score',
                    style: TextStyle(fontSize: 30),
                  ))
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(
                      Text("Arabic", style: rowStyle()),
                    ),
                    DataCell(Text("${target.arabic} " , style: rowStyle()))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("English", style: rowStyle())),
                    DataCell(Text("${target.english}", style: rowStyle()))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Math", style: rowStyle())),
                    DataCell(Text("${target.math}", style: rowStyle()))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Second language", style: rowStyle())),
                    DataCell(Text("${target.second}", style: rowStyle())),
                  ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                  color: Colors.blue,
                ),
                height: 60,
                child: Center(
                  child: Text(
                    "Change Marks",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
              Padding(
              padding: const EdgeInsets.only(right: 150.0, left: 9, top: 15),
              child: TextField(
                controller: _arabic,
                decoration: InputDecoration(

                    labelText: 'Arabic',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150.0, left: 9, top: 15),
              child: TextField(
                controller: _english,
                decoration: InputDecoration(
                    labelText: 'English',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150.0, left: 9, top: 15),
              child: TextField(
                controller: _math,
                decoration: InputDecoration(
                    labelText: 'Math',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150.0, left: 9, top: 15),
              child: TextField(
                controller: _second,
                decoration: InputDecoration(
                    labelText: 'Second Language',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
       Padding(
         padding: const EdgeInsets.all(100.0),
         child: FlatButton(
              child:Text('Change'),
              color: Colors.blue,
              onPressed: (){
                 print('object');
                    setState(() {
                      target.arabic =_arabic.text;
                      target.english =_english.text;
                      target.math = _math.text;
                      target.second = _second.text;
                      
                    });
                     _save();
              },
            ),
       )
              ],
            ),
          
          ],

        ),
          
    );
  }
  TextStyle rowStyle() {
    return TextStyle(fontSize: 20);
  }
   void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Student>> noteListFuture = databaseHelper.getStudentList();
      noteListFuture.then((noteList) {
        setState(() {
          this.studentList = noteList;
          this._count = noteList.length;
        });
      });
    });
  }
  void _save() async {
    int result;
    if (target.id != null) {
      // Case 1: Update operation
      result = await databaseHelper.updateStudent(target);
    } else {
      // Case 2: Insert Operation
      result = await databaseHelper.insertStudent(target);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Mark Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Marks');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}