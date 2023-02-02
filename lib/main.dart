import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/usuario/user_cubit.dart';

import 'package:states/pages/page1_pages.dart';
import 'package:states/pages/page2_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/page1',
        routes: {
          '/page1': (_) => const Page1Screen(),
          '/page2': (_) => const Page2Screen(),
        },
      ),
    );
  }
}
