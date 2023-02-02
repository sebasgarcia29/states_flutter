import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states/bloc/user/user_bloc.dart';
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
              final user = User(
                name: 'Juan',
                age: 30,
                professions: ['Developer', 'Designer'],
              );
              context.read<UserBloc>().add(ActivateUser(user));
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () => context.read<UserBloc>().add(ChangeUserAge(35)),
            icon: const Icon(Icons.plus_one),
          ),
          IconButton(
            onPressed: () =>
                context.read<UserBloc>().add(AddProfessionEvent('Developer')),
            icon: const Icon(Icons.work),
          ),
          IconButton(
            onPressed: () => {
              BlocProvider.of<UserBloc>(context).add(DeleteUser()),
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.existUser) {
            // return InformationUser(user: (state.user) as User);
            return InformationUser(user: state.user!);
          } else {
            return const Center(
              child: Text('No hay usuario seleccionado'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/page2'),
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class InformationUser extends StatelessWidget {
  final User user;

  const InformationUser({super.key, required this.user});

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
          ...user.professions
              .map((profession) => ListTile(title: Text(profession))),
        ],
      ),
    );
  }
}
