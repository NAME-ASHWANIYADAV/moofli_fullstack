import 'package:flutter/material.dart';

 import 'package:moofli_fullstack/home.dart';
import 'package:moofli_fullstack/landingpg.dart';
import 'package:moofli_fullstack/login-signup%20pages/loginpg.dart';
import 'package:moofli_fullstack/login-signup%20pages/signuppg1.dart';
import 'package:moofli_fullstack/profile.dart';
import 'package:moofli_fullstack/settings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moofli',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        useMaterial3: true,
      ),
      home: landingPage(),
    );
  }
}






