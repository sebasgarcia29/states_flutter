import 'package:flutter/material.dart';

import 'package:states/models/usuario.dart';

class UserService with ChangeNotifier {
  User? _user;

  User get user => _user!;
  bool get userIsLogged => _user != null;

  set user(User dataUser) {
    _user = dataUser;
    notifyListeners();
  }

  void changeAge(int age) {
    _user?.age = age;
    notifyListeners();
  }

  void logoutUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession() {
    _user?.professions
        ?.add('Proffesion ${(_user?.professions!.length)! + (1)}');
    notifyListeners();
  }
}
