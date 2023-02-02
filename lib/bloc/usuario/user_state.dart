part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UsuarioInitial extends UserState {
  final existUser = false;

  @override
  String toString() {
    return 'UserInitial $existUser';
  }
}

class UserActive extends UserState {
  final existUser = true;
  final User user;

  UserActive(this.user);
}
