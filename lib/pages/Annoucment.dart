import 'package:flutter/material.dart';
import 'package:school/models/annoucment.dart';

// class AnnoucmentWidget extends StatefulWidget {
//   @override
//   _State createState() => new _State();
// }

// class _State extends State<AnnoucmentWidget> {
//   List<Annoucment> _news = [];

//   final _content = TextEditingController();
//   final _header = TextEditingController();
//   void _addNewAnnouncement(Annoucment annoucment) {
//     setState(() {
      

//     });
//   }

//   void _removeAnnouncement() {
//     setState(() {
//       _titles.removeLast();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
     
//       body: new Container(
//         padding: new EdgeInsets.all(32.0),
//         color: Colors.white70,
//         child: new Center(
//           child: new Column(
//             children: <Widget>[
//               new Expanded(
//                 child: new TextField(
//                   controller: _header,
//                 ),
//               ),
//               new Expanded(
//                 child: new Row(
//                   children: <Widget>[
//                     new IconButton(
//                         icon: Icon(Icons.add),
//                         onPressed: () =>
//                             _addNewAnnouncement(_content.text)),
//                     new IconButton(
//                         icon: Icon(Icons.remove),
//                         onPressed: _removeAnnouncement),
//                   ],
//                 ),
//               ),
//               new Expanded(
//                   child: new ListView.builder(
//                 itemBuilder: (context, index) {
//                   return Card(
//                       color: Colors.lightBlueAccent,
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(width: 100, style: BorderStyle.none),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: new Column(
//                         children: <Widget>[
//                           new Text(_titles.elementAt(index),
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                   color: Colors.black)),
//                         ],
//                       ));
//                 },
//                 padding: new EdgeInsets.all(16.0),
//                 itemCount: _titles.length,
//               ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
