import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states/bloc/usuario/user_cubit.dart';
import 'package:states/models/usuario.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
        actions: [
          IconButton(
            onPressed: () {
              // final userCubit = context.read<UserCubit>();
              // userCubit.clearUser();
              context.read<UserCubit>().clearUser();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/page2'),
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      // if (state is UsuarioInitial) {
      //   return const Center(child: Text('No hay usuario'));
      // } else if (state is UserActive) {
      //   return InformationUser(state.user);
      // } else {
      //   return const Center(child: Text('State undefined'));
      // }
      switch (state.runtimeType) {
        case UsuarioInitial:
          return const Center(child: Text('No hay usuario'));
        case UserActive:
          return InformationUser((state as UserActive).user);
        default:
          return const Center(child: Text('State undefined'));
      }
    });
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
          // const ListTile(title: Text('Profesion2: ')),
          // const ListTile(title: Text('Profesion3: ')),
          if (user.professions != null)
            ...?user.professions
                ?.map((profession) => ListTile(title: Text(profession)))
                .toList(),
        ],
      ),
    );
  }
}
