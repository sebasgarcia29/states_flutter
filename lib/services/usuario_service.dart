import 'dart:async';
import 'package:states/models/usuario.dart';

class _UserService {
  // User? _user = User(
  //   name: 'Juan',
  //   age: 30,
  //   professions: [
  //     'Developer',
  //     'Designer',
  //     'Tester',
  //   ],
  // );
  User? _user;

  final StreamController<User> _userStreamController =
      StreamController<User>.broadcast();

  User? get user => _user;
  bool get isLogged => _user != null;

  Stream<User> get userStream => _userStreamController.stream;

  void loadUser(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void changeAge(int age) {
    _user?.age = age;
    _userStreamController.add(user!);
  }

  dispose() {
    _userStreamController.close();
  }
}

final userService = _UserService();
