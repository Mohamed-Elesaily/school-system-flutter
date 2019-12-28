

import 'package:flutter/material.dart';
import 'package:school/pages/Annoucment.dart';
import 'package:school/pages/Home.dart';
import 'package:school/pages/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {   
        '/': (context) => Home(),
        '/login': (context) => Login(),
      },
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   primaryColor: Colors.blueGrey,
      // ),
      
    );
  }
}