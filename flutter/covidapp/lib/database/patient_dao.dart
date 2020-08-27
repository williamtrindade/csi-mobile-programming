import 'package:covidapp/models/patient_model.dart';
import 'package:flutter/widgets.dart';

class PatientDAO {
  static final List<PatientModel> _patientes = List();

  static add(PatientModel patientModel) {
    _patientes.add(patientModel);
  }

  static PatientModel getPatient(int index) {
    return _patientes.elementAt(index);
  }

  static void update(PatientModel patientModel) {
    debugPrint('novo ' + patientModel.toString());
    debugPrint('antes ${_patientes}');
    _patientes
        .replaceRange(patientModel.id, patientModel.id + 1, [patientModel]);
    debugPrint("depois ${_patientes}");
  }

  static get listPatients {
    return _patientes;
  }
}
