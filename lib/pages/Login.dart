import 'package:flutter/material.dart';
import 'package:school/models/admin.dart';
import 'package:school/models/student.dart';
import 'package:school/models/teacher.dart';
import 'package:school/utils/database_helper.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
  
class _LoginState extends State<Login> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  Teacher teacher;
  Admin admin;
  List<Student> studentList;

  @override
  Widget build(BuildContext context) {
      if (studentList == null) {
			studentList = List<Student>();
		}
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin:Alignment.topLeft,
          //       end:Alignment.bottomRight,
          //       stops: [0.75,0.2,1],
          //       colors:[
          //         Colors.blue[800],
          //         Colors.blue[500],
          //         Colors.blue[100],
          //       ]
          //     ),

          //   ),

          // ),

          // ___________________decoration__________________________  //
          Container(
            color: Colors.blue[900],
          ),
          Positioned(
            // right: 200,
            top: 5,
            child: CircleAvatar(
              // child: Icon(Icons.ac_unit),
              backgroundColor: Colors.blue,
              radius: 500,
            ),
          ),

          //  _______________________________Login________________________  //
          ListView(
            children: <Widget>[
              SafeArea(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[title()],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _name,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: 'Email',
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextField(
                            controller: _password,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hintText: 'Password',
                            ),
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ), 
                        radius: 50,
                      ),
                      onTap: () {
                        check(_name.text, _password.text);
                      },
                    ),
                    
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
    
  }

  Padding title() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'SCHOOL SYSTEM',
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );



  }
     
bool check(String name,String password){
    if(name == teacher.name ){
      if(password == teacher.password){
        print('teacher');
        return true;
        }
        }
        if(name == admin.name ){
      if(password == admin.password){
        print('admin');
        return true;
        }
        }
    for(int i = 0;i< studentList.length;i++){
        if(name == studentList[i].name){
            if(password == studentList[i].password){
                print('student');
                return true;
            }          
        }

    }
  return false;
}
}

