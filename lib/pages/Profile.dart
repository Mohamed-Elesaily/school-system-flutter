import 'package:flutter/material.dart';
import 'package:school/models/student.dart';
import 'package:school/pages/Login.dart';
import 'package:school/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Student> studentList;
  Student target = Student();
  String _per;
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    
    if (id == -1){
      
        _per = '1';//teacher 
    
    }else if(id == -2){
      
        _per ='0';
      
    }else{

        _per ='2';
        updateListView();
        for(int i=0; i< _count; i++){
          if(id == studentList[i].id){
            target = studentList[i];
          }
        }


    }
    return Scaffold(
      body: _chooseUsr(_per)
    );
  }
  //____________________functions_____________________//
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
      case '1':
        return teacher();
        break;
      case '2':
        return student();
        break;
      default: return ListView();  
    }
  }
  ListView teacher(){
    return ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.blue,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 800.0,
                  width: double.infinity,
                  color: Colors.blue[900],
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  img(),
                  SizedBox(height: 50,),
                  jop('Teacher'),

                  Divider(
                    color: Colors.white,
                    height: 60,
                  ),
                  SizedBox(height: 50,),
                  Text("Phone: +015708090",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:20
                  ),
                  )
                ],
              ),
            ],
          ),
        ],
      );
  }
  ListView admin(){
    return ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.blue,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 800.0,
                  width: double.infinity,
                  color: Colors.blue[900],
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  img(),
                  SizedBox(height: 50,),
                  jop('Admin'),

                  Divider(
                    color: Colors.white,
                    height: 60,
                  ),
                  SizedBox(height: 50,),
                  Text("Phone: +016708090",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:20
                  ),
                  )
                ],
              ),
            ],
          ),
        ],
      );
  }
  
  ListView student(){
    return ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.blue,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 800.0,
                  width: double.infinity,
                  color: Colors.blue[900],
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  img(),
                  SizedBox(height: 50,),
                  jop('Student'),

                  Divider(
                    color: Colors.white,
                    height: 60,
                  ),
                  SizedBox(height: 50,),
                  Text("Name: ${target.name}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:20
                  ),
                  ),
                  SizedBox(height: 10,),
                  Text("Age: ${target.age}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:20
                  ),
                  ),
                  SizedBox(height: 10,),
                  Text("Acadmic Year: ${target.academic}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:20
                  ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
  }
  
  Row img(){
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.perm_identity,
                      size:100 ,
                      ),
                      radius: 60,
                  ),
                ],
              );
  }
  
  Container jop(String work){
    return Container(
                child: Text(
                  '$work',
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w300
                    ),
                  ),
                // color: Colors.blue,
              );
  }
  

}
