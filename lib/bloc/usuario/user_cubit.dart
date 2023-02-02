import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/models/usuario.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UsuarioInitial());

  void selectUser(User user) {
    emit(UserActive(user));
  }

  void changeAge(int age) {
    // Mutacion
    // final currentState = state;
    // if (currentState is UserActive) {
    //   currentState.user.age = age;
    //   emit(UserActive(currentState.user));
    // }
    final currentState = state;
    if (currentState is UserActive) {
      final newUser = currentState.user.copyWith(age: age);
      emit(UserActive(newUser));
    }
  }

  void addProfessions(String profession) {
    final currentState = state;
    if (currentState is UserActive) {
      final count = currentState.user.professions?.length;
      String newName = 'profession $count';
      final newUser = currentState.user
          .copyWith(professions: [...?currentState.user.professions, newName]);
      emit(UserActive(newUser));
    }
  }

  void clearUser() {
    emit(UsuarioInitial());
  }
}
