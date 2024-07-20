import 'package:flutter/material.dart';
import 'package:moofli_fullstack/diary_entry.dart';
import 'package:moofli_fullstack/settings.dart';
import 'package:moofli_fullstack/sidebar.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: DiaryEntry(),
    );
  }
}






