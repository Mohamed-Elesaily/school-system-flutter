import 'package:flutter/material.dart';
import 'package:school/models/annoucment.dart';
import 'package:school/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  DatabaseHelper databaseHelper = DatabaseHelper();
	List<Annoucment> annoucmentList;
	int count = 0;
  @override
  Widget build(BuildContext context) {
    		if (annoucmentList == null) {
			annoucmentList = List<Annoucment>();
			updateListView();
		}
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
          ListView.builder(
            itemCount: count,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(50.0),
                child: Card(
                  child: ListTile(
                    title: Text(annoucmentList[index].title),
                    subtitle: Text(annoucmentList[index].description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                    
                    ),
                    leading: CircleAvatar(
                      child: Text('A' ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
 void updateListView() {

		final Future<Database> dbFuture = databaseHelper.initializeDatabase();
		dbFuture.then((database) {

			Future<List<Annoucment>> noteListFuture = databaseHelper.getNoteList();
			noteListFuture.then((noteList) {
				setState(() {
				  this.annoucmentList = noteList;
				  this.count = noteList.length;
				});
			});
		});
  }  
}
