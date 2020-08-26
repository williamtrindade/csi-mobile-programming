import 'dart:io';

import 'package:covidapp/database/patient_dao.dart';
import 'package:covidapp/models/patient_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class PatientCreate extends StatefulWidget {

  @override
  _PatientCreateState createState() => _PatientCreateState();
}

class _PatientCreateState extends State<PatientCreate> {

  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _cardTextEditingController = TextEditingController();
  final TextEditingController _ageTextEditingController = TextEditingController();
  final TextEditingController _passTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar paciente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _avatarPhoto(context),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nome obrigatorio';
                    }
                    return null;
                  },
                  controller: this._nameTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                  style: TextStyle(fontSize: 24),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'E-mail obrigatorio';
                    }
                    return null;
                  },
                  controller: this._emailTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Cartao SUS obrigatorio';
                    }
                    return null;
                  },
                  controller: this._cardTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'Cartao do SUS',
                  ),
                  style: TextStyle(fontSize: 24),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Idade obrigatoria';
                    }
                    return null;
                  },
                  controller: this._ageTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'Idade',
                  ),
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Senha obrigatoria';
                    }
                    return null;
                  },
                  controller: this._passTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                  style: TextStyle(fontSize: 24),
                  obscureText: true,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.all(18),
                    elevation: 6.0,
                    color: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        PatientModel patientModel = new PatientModel(
                            0,
                            this._nameTextEditingController.text,
                            this._emailTextEditingController.text,
                            this._cardTextEditingController.text,
                            int.tryParse(this._ageTextEditingController.text),
                            this._passTextEditingController.text,
                            this._userPhoto
                        );
                        PatientDAO.add(patientModel);
                        Navigator.of(context).pop();
                      } else {
                        debugPrint('invalid');
                      }
                    },
                    child: Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _avatarPhoto(BuildContext buildContext) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            this.takeShotAlertDialog(buildContext);
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: this._userPhotoWidget(),
                )
            ),
            radius: 70,
          ),
        ),
        Text('Foto do paciente'),
      ],
    );
  }

  takeShotAlertDialog(BuildContext buildContext) {
    AlertDialog alertDialog = AlertDialog(
      title: Text('Tirar foto', style: TextStyle(fontWeight: FontWeight.bold),),
      content: Text('Escolha entre a camera ou galeraia para a foto'),
      elevation: 5.0,
      actions: [
        FlatButton(
          onPressed: () {
            _getImage(ImageSource.camera);
            Navigator.of(buildContext).pop();
          },
          child: Text('Camera'),
        ),
        FlatButton(
          onPressed: () {
            _getImage(ImageSource.gallery);
            Navigator.of(buildContext).pop();
          },
          child: Text('Galeria'),
        ),
      ],
    );

    showDialog(
      context: buildContext,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }

  String _userPhoto = '';

  _getImage(ImageSource imageSource) async {
    final image = await ImagePicker().getImage(source: imageSource);

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioY: 1, ratioX: 1),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.white,
          toolbarTitle: 'Cortar imagem',
          statusBarColor: Colors.blue,
          backgroundColor: Colors.white,
        )
      );
      setState(() {
        this._userPhoto = cropped.path;
      });
    }
  }

  _userPhotoWidget() {
    Widget child;
    if (this._userPhoto == '') {
      child = Icon(Icons.camera, size: 100,);
    } else {
      child = Image.file(
          File(this._userPhoto)
      );
    }
    return child;
  }
}
