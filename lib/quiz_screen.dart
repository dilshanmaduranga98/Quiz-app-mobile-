import 'package:flutter/material.dart';
import 'package:quiz_application/components/custom_button.dart';
import 'package:quiz_application/data/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.onSelectanswer});


final void Function(String answer) onSelectanswer;


  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;

  void answeredQuestion(String answer) {
    widget.onSelectanswer(answer);
    setState(() {
      currentQuestionIndex++;

          print(answer);
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = queations[currentQuestionIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Question $currentQuestionIndex out of 6',
          style: const TextStyle(color: Color.fromARGB(141, 230, 232, 252)),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20,),
          child: SizedBox(
            child: Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style:const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 27,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ...currentQuestion.getShuffledAnswerd().map(
          (answer) {
            return Container(
              margin: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: CustomButton(
                  text: answer,
                  function: () {
                    answeredQuestion(answer);
                  },
                  const Color.fromARGB(255, 252, 252, 252),
                  Colors.black),
            );
          },
        ),
      ],
    );
  }
}
