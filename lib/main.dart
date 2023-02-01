import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:states/pages/page1_pages.dart';
import 'package:states/pages/page2_pages.dart';
import 'package:states/services/usuario_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserService(),
        )
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
