import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //pass the function as parameter to widget
  const HomePage(this.startQuiz, {super.key});

//pass the function as parameter to widget
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/cfLogo.png',
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
         const Text(
          'CodeFlare',
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.bold,
            color:  Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const Text(
          "Learn Flutter with Fun!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 120,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 20,
              right: 20,
            ),
          ),
          label: const Text('Start Quiz', ),
          icon: const Icon(Icons.trending_flat),
        )
      ],
    );
  }
}
