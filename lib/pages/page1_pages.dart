import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:states/services/usuario_service.dart';
import '../models/usuario.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserService userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
        actions: [
          IconButton(
              onPressed: () => userService.logoutUser(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: userService.userIsLogged
          ? InformationUser(userService.user)
          : const Center(child: Text('No user logged')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/page2'),
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class InformationUser extends StatelessWidget {
  final User user;

  const InformationUser(this.user, {super.key});

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
          // const ListTile(title: Text('Profesion1: ')),
          // user.professions != null
          //     ? ListView.builder(
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemCount: user.professions?.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           final profession = user.professions![index];
          //           return ListTile(title: Text(profession));
          //         },
          //       )
          //     : const Center(child: Text('No professions')),

          ...user.professions!
              .map((profession) => ListTile(title: Text(profession)))
              .toList(),
        ],
      ),
    );
  }
}
