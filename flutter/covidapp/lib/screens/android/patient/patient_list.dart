import 'package:covidapp/database/patient_dao.dart';
import 'package:covidapp/models/patient_model.dart';
import 'package:covidapp/screens/android/patient/patient_create.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {

  List<PatientModel> _patients = PatientDAO.listPatients;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacientes'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
              style: TextStyle(
                fontSize: 25
              ),
              decoration: InputDecoration(
                labelText: 'Pesquisar',
                hintText: 'Pesquisar',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: _patients.length,
                itemBuilder: (context, index) {
                  final PatientModel p = _patients[index];
                  return PatientItem(p);
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => PatientCreate()
            )
          ).then((value) {
            setState(() { });
          });
        },
      ),
    );
  }
}

class PatientItem extends StatelessWidget {

  final PatientModel _patientModel;

  PatientItem(this._patientModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/avatar.jpg'),
          ),
          title: Text(
            this._patientModel.name,
            style: TextStyle(fontSize: 24),
          ),
          subtitle: Text(
            this._patientModel.email,
            style: TextStyle(fontSize: 12),
          ),
          trailing: _menu(),
        ),
        Divider(
          color: Colors.green,
          indent: 70.0,
          endIndent: 20,
          thickness: 1.0,
          height: 0,
        ),
      ],
    );
  }
  
  Widget _menu() {
    return PopupMenuButton(
      onSelected: (ListPatientsMenuItems selected) {
        debugPrint('slecionado $selected');
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<ListPatientsMenuItems>>[
        const PopupMenuItem(
          value: ListPatientsMenuItems.edit,
          child: Text('Editar'),
        ),
        const PopupMenuItem(
          value: ListPatientsMenuItems.results,
          child: Text('Resultados'),
        ),
        const PopupMenuItem(
          value: ListPatientsMenuItems.new_checklist,
          child: Text('Novo checklist'),
        )
      ]
    );
  }
}

enum ListPatientsMenuItems {
  edit,
  results,
  new_checklist
}