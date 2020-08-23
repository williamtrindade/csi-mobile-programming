import 'dart:io';

import 'package:covidapp/screens/android/appcovid.dart';
import 'package:flutter/material.dart';

void main() {
  if (Platform.isAndroid) {
    debugPrint('App no android');
    runApp(AppCovid());
  }
  if (Platform.isIOS) {
    debugPrint('App no IOS');
  }
  // runApp(MyApp());
}

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('App Covid-19'),
//        ),
//      )
//    );
//  }
//}