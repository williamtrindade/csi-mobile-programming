import 'package:covidapp/models/patient_model.dart';

class PatientDAO {
  static final List<PatientModel> _patientes = List();

  static add(PatientModel patientModel) {
    _patientes.add(patientModel);
  }

  static get listPatients {
    return _patientes;
  }
}