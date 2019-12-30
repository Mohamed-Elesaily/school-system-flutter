

import 'package:flutter/material.dart';
import 'package:school/pages/Home.dart';
import 'package:school/pages/Login.dart';
import 'package:school/pages/Mark.dart';
import 'package:school/pages/Pay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {   
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/marks' : (context) => Mark(),
        '/pay' : (context) => Pay(),
      },
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   primaryColor: Colors.blueGrey,
      // ),
      
    );
  }
}