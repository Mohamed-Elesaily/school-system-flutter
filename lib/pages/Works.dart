import 'package:flutter/material.dart';
import 'package:school/models/annoucment.dart';
import 'package:school/utils/database_helper.dart';

class Works extends StatefulWidget {
  @override
  _WorksState createState() => _WorksState();
}

class _WorksState extends State<Works> {
  DatabaseHelper helper = DatabaseHelper();
  Annoucment annoucment = Annoucment('_title', '_description');

  String _per = "0";
  String _subject="";
  String _activity ="m";
  final _title = TextEditingController();
  final _content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return _chooseUsr(_per);
  }

  ListView _chooseUsr(String priority) {
    switch (priority) {
      case '0':
        return admin();
        break;
      case '1':
        return student();
        break;
      case '2':
        return admin();
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
            decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        // Row(
        //   children: <Widget>[
        //     DropdownButton<String>(
        //       items: [
        //         DropdownMenuItem(
        //           value: "1",
        //           child: Text(
        //             "First",
        //           ),
        //         ),
        //         DropdownMenuItem(
        //           value: "2",
        //           child: Text(
        //             "Second",
        //           ),
        //         ),
        //       ],
        //       onChanged: (value) {
        //         setState(() {
        //           _m = value;
        //         });
        //       },
        //       value: _m,
        //     ),
        //   ],
        // ),
        Padding(
          padding: const EdgeInsets.only(right: 150.0, left: 9, top: 15),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 150.0, left: 9, top: 15),
          child: TextField(
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
          onPressed: () {},
        ),

        Divider(
          height: 20,
        ),
      ],
    );
  }

  ListView student() {
    
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
                DataCell(Text("Arabic", style: rowStyle()),
                    showEditIcon: true, onTap: () {}),
                DataCell(Text("20", style: rowStyle()))
              ]),
              DataRow(cells: [
                DataCell(Text("English", style: rowStyle())),
                DataCell(Text("20", style: rowStyle()))
              ]),
              DataRow(cells: [
                DataCell(Text("Math", style: rowStyle())),
                DataCell(Text("20", style: rowStyle()))
              ]),
              DataRow(cells: [
                DataCell(Text("$_subject", style: rowStyle())),
                DataCell(Text("", style: rowStyle())),
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
           

        ],)
        
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
			result = await helper.updateNote(annoucment);
		} else { // Case 2: Insert Operation
			result = await helper.insertNote(annoucment);
		}

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Annoucment Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Annoucment');
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
