class PatientModel {
  int _id;
  String _name;
  String _email;
  String _card;
  int _age;
  String _pass;
  String _photo;

  PatientModel(this._id, this._name, this._email, this._card, this._age,
      this._pass, this._photo);

  String get photo => _photo;

  String get pass => _pass;

  int get age => _age;

  String get card => _card;

  String get email => _email;

  String get name => _name;

  int get id => _id;

  // ignore: unnecessary_getters_setters
  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Patient{id: ${id}, nome: ${name}, email: ${email}';
  }
}
