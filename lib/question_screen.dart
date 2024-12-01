import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestuonScreenState();
  }
}

class _QuestuonScreenState extends State<QuestionScreen> {
  void yesFunction() {
    //.....
    setState(() {
      print('Yes');
    });
  }

  void noFunction() {
    //.....
    setState(() {
      print('No');
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding:  EdgeInsets.all(10),
          child:  Text(
            "You're about to enter the quiz section. Do you want to continue?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton.icon(
              onPressed: yesFunction,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.check_circle_rounded),
              label: const Text('Yes'),
            ),
            const SizedBox(
              width: 50,
            ),
            OutlinedButton.icon(
              onPressed: noFunction,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon:const Icon(Icons.cancel_sharp),
              label: const Text('No'),
            )
          ],
        ),
      ],
    );
  }
}
