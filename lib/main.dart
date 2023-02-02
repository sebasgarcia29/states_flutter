import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:states/pages/page1_pages.dart';
import 'package:states/pages/page2_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/page1',
      // routes: {
      //   '/page1': (_) => const Page1Screen(),
      //   '/page2': (_) => const Page2Screen(),
      // },
      getPages: [
        GetPage(name: '/page1', page: () => const Page1Screen()),
        GetPage(name: '/page2', page: () => const Page2Screen()),
      ],
    );
  }
}
