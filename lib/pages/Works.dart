import 'package:flutter/material.dart';
import 'package:school/models/annoucment.dart';
import 'package:school/models/student.dart';
import 'package:school/pages/Login.dart';
import 'package:school/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
class Works extends StatefulWidget {
  @override
  _WorksState createState() => _WorksState();
}

class _WorksState extends State<Works> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  Annoucment annoucment = Annoucment('_title', '_description');
  Student student = Student();
  String _per = "2";
  String _subject="";
  String _activity =" ";
  final _title = TextEditingController();
  final _content = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _age = TextEditingController();
  final _aca = TextEditingController();
   
  Student target = Student();
  List<Student> studentList;

  int _count = 0;
  @override
  Widget build(BuildContext context) {
     if (id == -1){
      setState(() {
        _per = '1';//teacher 
      });
    }else if(id == -2){
      setState(() {
        _per ='0';
      });
    }else{
           _per ='2';
        updateListView();
        for(int i=0; i< _count; i++){
          if(id == studentList[i].id){
            target = studentList[i];
          }
        }
    }
    return _chooseUsr(_per);
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
  ListView _chooseUsr(String priority) {
    switch (priority) {
      case '0':
        return admin();
        break;
      case '2':
        return studentWidget();
        break;
      case '1':
        return teacher();
        break;
      default: return ListView();  
    }
  }

  ListView admin() {
    
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        //_______________________________annoucment__________________________ //

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
                "New Announcment",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _title,
            decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _content,
            decoration: InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        FlatButton(
          child: Text(
            'Submit',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.blue,
          onPressed: () {
            setState(() {
                          annoucment.title = _title.text;
                          annoucment.description = _content.text;
									    	  debugPrint("Save button clicked");
									    	  _save();
									    	});
          },
        ),
        Divider(
          height: 20,
        ),

        //______________________New Student_________________________//
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
                "New Student",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _name, 
            decoration: InputDecoration(

                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _password,
            decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
      
        Padding(
          padding: const EdgeInsets.only(right: 150.0, left: 9, top: 15),
          child: TextField(
            controller: _age,
            decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 150.0, left: 9, top: 15),
          child: TextField(
            controller: _aca,
            decoration: InputDecoration(
                labelText: 'Acadmic Year',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        FlatButton(
          child: Text(
            'Submit',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.blue,
          onPressed: () {
            setState(() {
              student.name = _name.text;
              print(student.name);
              student.password = _password.text;
              print(student.password);
              student.age = _age.text;
              student.academic = _aca.text;
              _saveStudent();
              print('add student');

            });
          },
        ),

        Divider(
          height: 20,
        ),
      ],
    );
  }

  ListView studentWidget() {
    
    return ListView(
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
                DataCell(Text("Arabic", style: rowStyle()),),
                DataCell(Text("${target.arabic} ", style: rowStyle()))
              ]),
              DataRow(cells: [
                DataCell(Text("English", style: rowStyle())),
                DataCell(Text("${target.english} ", style: rowStyle()))
              ]),
              DataRow(cells: [
                DataCell(Text("Math", style: rowStyle())),
                DataCell(Text("${target.math} ", style: rowStyle()))
              ]),
              DataRow(cells: [
                DataCell(Text("$_subject", style: rowStyle())),
                DataCell(Text("${target.second} ", style: rowStyle())),
              ])
            ],
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Activity',style: TextStyle(fontSize: 30)),
            Text('$_activity',style:rowStyle() ),
          ],
        ),
        
        Divider(),
        SizedBox(height: 30,),
        Center(
            child: Text('Registration Course', style: TextStyle(fontSize: 30))),
        Divider(),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              child: CircleAvatar(
                child: Text(
                  'French',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                radius: 50,
              ),
              onTap: () {
                setState(() {
                  _subject = "French";
             
                });
              },
            ),
            InkWell(
              child: CircleAvatar(
                child: Text(
                  'Germany',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                radius: 50,
              ),
              onTap: () {
                setState(() {
                  _subject = "Germany";
                 
                });
              },
            ),
          ],
        ),
        SizedBox(height: 20,),
        Divider(),
        Center(
            child: Text('Activities', style: TextStyle(fontSize: 30))),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            activity("Football"),
            activity("Basketball"),
            activity("Volleyball"),
           

        ],),
        SizedBox(
          height: 30,
        ),
        InkWell(
              child: CircleAvatar(
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                radius: 50,
              ),
              onTap: () {
                setState(() {
                
                 
                });
              },
            ),
            SizedBox(
          height: 30,
        ),
        
      ],
    );
  }

  ListView teacher(){
     return ListView(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        //_______________________________annoucment__________________________ //

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
                "New Announcment",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _title,
            decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _content,
            decoration: InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        FlatButton(
          child: Text(
            'Submit',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.blue,
          onPressed: () {
            setState(() {
                          annoucment.title = _title.text;
                          annoucment.description = _content.text;
									    	  debugPrint("Save button clicked");
									    	  _save();
									    	});
          },
        ),
        Divider(
          height: 20,
        ),

      ],
    );
  }
  TextStyle rowStyle() {
    return TextStyle(fontSize: 20);
  }
  InkWell activity(String activity){
    return  InkWell(
      child:CircleAvatar(
                child: Text(
                  '$activity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                radius: 50,
              ),
              onTap: () {
                setState(() {
                  _activity = "$activity";
             
                });
              }
    );
  }

  void _save() async {

	
		int result;
		if (annoucment.id != null) {  // Case 1: Update operation
			result = await databaseHelper.updateNote(annoucment);
		} else { // Case 2: Insert Operation
			result = await databaseHelper.insertNote(annoucment);
		}

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Annoucment Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Annoucment');
		}

	}
    void _saveStudent() async {

	
		int result;
		if (student.id != null) {  // Case 1: Update operation
			result = await databaseHelper.updateStudent(student);

		} else { // Case 2: Insert Operation
			result = await databaseHelper.insertStudent(student);
		}

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Student Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Student');
		}

	}
  void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}





}
