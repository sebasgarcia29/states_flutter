import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:states/models/usuario.dart';
import 'package:states/services/usuario_service.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserService userService =
        Provider.of<UserService>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: userService.userIsLogged
            ? Text('Name: ${userService.user.name}')
            : const Text('Page2'),
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
                  professions: [
                    'Developer',
                    'Designer',
                    'Tester',
                  ],
                );
                userService.user = newUser;
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Set age',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userService.changeAge(28);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Set profession',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => userService.addProfession(),
            ),
          ],
        ),
      ),
    );
  }
}
