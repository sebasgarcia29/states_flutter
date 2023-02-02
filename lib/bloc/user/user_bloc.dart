import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:states/models/usuario.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      emit(UserSetState(event.user));
    });
    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(age: event.age)));
    });
    on<AddProfessionEvent>((event, emit) {
      if (!state.existUser) return;
      final professions = [
        ...state.user!.professions,
        '${event.profession} ${state.user!.professions.length + 1}'
      ];
      emit(UserSetState(state.user!.copyWith(professions: professions)));
    });
    on<DeleteUser>((event, emit) {
      emit(const UserInitialState());
    });
  }
}
