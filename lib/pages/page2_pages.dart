import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';

import 'package:states/models/usuario.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocUser = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Set user',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                final newUser = User(
                  name: 'Sebastian',
                  age: 27,
                  professions: ['Developer'],
                );
                blocUser.add(ActivateUser(newUser));
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Set age',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                blocUser.add(ChangeUserAge(28));
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Set profession',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                blocUser.add(AddProfessionEvent('New Profession'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
