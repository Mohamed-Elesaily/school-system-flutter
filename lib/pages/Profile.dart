import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _chooseUsr('2')
    );
  }
  //____________________functions_____________________//
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
                  Text("Name: mohamed",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:20
                  ),
                  ),
                  SizedBox(height: 10,),
                  Text("Age: 21",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:20
                  ),
                  ),
                  SizedBox(height: 10,),
                  Text("Acadmic Year: 4",
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
