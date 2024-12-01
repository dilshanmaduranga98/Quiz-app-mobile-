import 'package:flutter/material.dart';

class QuizTemplate extends StatelessWidget {
  const QuizTemplate(this.text,{super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 35,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
