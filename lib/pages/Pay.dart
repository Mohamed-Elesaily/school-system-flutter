import 'package:flutter/material.dart';

class Pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Image.asset(
            "assets/images/fawry_pay.png",
            height: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Fawry number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
Image.asset(
            "assets/images/visa.png",
            height: 100,
          ),
           SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Credit card number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
                      child: CircleAvatar(
              child: Text('Pay',style: TextStyle(fontSize: 20),),
              radius: 50,
            ),
            onTap: (){

            },
          )
        ],
      ),
    );
  }
}
