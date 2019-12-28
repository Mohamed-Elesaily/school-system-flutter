import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  jop(),

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
      ),
    );
  }
  //____________________functions_____________________//
  
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
  
  Container jop(){
    return Container(
                child: Text(
                  'Admin',
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
