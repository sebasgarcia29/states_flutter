import 'package:flutter/material.dart';

import 'package:states/pages/page1_pages.dart';
import 'package:states/pages/page2_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/page1',
      routes: {
        '/page1': (_) => const Page1Screen(),
        '/page2': (_) => const Page2Screen(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
