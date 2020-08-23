import 'package:covidapp/screens/android/login.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Login()
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(right:25, left:25),
              child: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            // color: Colors.blue,
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Checklist Covid-19',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),
            )
          ),
        ],
      )
    );
  }
}
