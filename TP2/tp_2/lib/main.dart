import 'package:flutter/material.dart';

import 'QuizzPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const QuizzPage(title: 'Questions/Réponses'),
    );
  }
}
