import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/pages/intro_page.dart';
import 'models/shop.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    //   routes: {
    //      '/intropage': (context) => const IntroPage(),
    //      '/menupage': (context) => const MenuPage(),
    //  },
    );
  }
}
