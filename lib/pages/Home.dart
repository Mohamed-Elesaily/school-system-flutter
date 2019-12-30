import 'package:flutter/material.dart';
import 'package:school/pages/News.dart';
import 'package:school/pages/Profile.dart';
import 'package:school/pages/Works.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
           
          appBar: AppBar(
            
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.perm_identity)),
                Tab(icon: Icon(Icons.work)),
              ],
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 30),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: <Widget>[
            
              TabBarView(
                children: [
                  News(),
                Profile(),
                 Works(),
                
                ],

              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
