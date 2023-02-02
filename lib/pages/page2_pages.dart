import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/usuario/user_cubit.dart';
import 'package:states/models/usuario.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

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
                  professions: ['Developer', 'Lawyer'],
                );
                userCubit.selectUser(newUser);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Set age',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCubit.changeAge(30);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Set profession',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCubit.addProfessions('Developer');
              },
            ),
          ],
        ),
      ),
    );
  }
}
