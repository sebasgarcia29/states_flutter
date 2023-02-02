import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:states/controllers/user_controller.dart';
import 'package:states/models/usuario.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCrl = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: Obx(() => userCrl.existUser.value
          ? InformationUser(user: userCrl.user.value)
          : const NotUserLogged()),
      // body: userCrl.existUser.value
      //     ? const InformationUser()
      //     : const NotUserLogged(),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Get.to(const Page2Screen()),
        onPressed: () => Get.toNamed('/page2', arguments: {
          'name': 'Sebastian',
          'age': 27,
        }),
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class NotUserLogged extends StatelessWidget {
  const NotUserLogged({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No user selected'),
    );
  }
}

class InformationUser extends StatelessWidget {
  final User user;
  const InformationUser({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Name: ${user.name}')),
          ListTile(title: Text('Age: ${user.age}')),
          const Text('Professions: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.professions!.map((e) => ListTile(title: Text(e))),
        ],
      ),
    );
  }
}
