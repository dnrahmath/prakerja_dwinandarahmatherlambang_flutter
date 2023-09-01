import 'package:flutter/material.dart';

import './view/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

//--------------------------------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halo Alterra',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 44, 44, 44),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MaterialApp'),
    );
  }
}

//--------------------------------------------
