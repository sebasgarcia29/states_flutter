import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:states/controllers/user_controller.dart';
import 'package:states/models/usuario.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Get.arguments['name']);

    final userCtrl = Get.find<UserController>();

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
                );
                userCtrl.loadUser(newUser);
                Get.showSnackbar(const GetSnackBar(
                  title: 'User loaded',
                  message: 'User loaded successfully',
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.grey,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                    ),
                  ],
                ));
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Set age',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCtrl.changeAge(28);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Set profession',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCtrl.addProfession(
                    'Flutter developer # ${userCtrl.professionsCount + 1}');
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Change theme',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
            ),
          ],
        ),
      ),
    );
  }
}
