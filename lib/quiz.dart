import 'package:flutter/material.dart';
import 'gradient_color_container.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientColorContainer(
          Color.fromARGB(255, 36, 11, 104),
          Color.fromARGB(255, 115, 69, 196),
        ),
      ),
    );
  }
}
