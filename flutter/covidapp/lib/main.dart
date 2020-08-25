import 'dart:io';

import 'package:covidapp/database/patient_dao.dart';
import 'package:covidapp/screens/android/appcovid.dart';
import 'package:flutter/material.dart';

import 'models/patient_model.dart';

void main() {
  _generatepatients() {
    PatientModel p1 = PatientModel(1, 'William2', 'wil@odig.net', '42342423', 21, 'laraverl');
    PatientModel p2 = PatientModel(1, 'William', 'wil@odig.net', '42342423', 21, 'laraverl');
    PatientModel p3 = PatientModel(1, 'William', 'wil@odig.net', '42342423', 21, 'laraverl');
    PatientModel p4 = PatientModel(1, 'William', 'wil@odig.net', '42342423', 21, 'laraverl');
    PatientDAO.add(p1);
    PatientDAO.add(p2);
    PatientDAO.add(p3);
    PatientDAO.add(p4);
  }
  if (Platform.isAndroid){
    debugPrint('App no android');
    _generatepatients();
    runApp(AppCovid());
  }
  if (Platform.isIOS) {
    debugPrint('App no IOS');
  }
}