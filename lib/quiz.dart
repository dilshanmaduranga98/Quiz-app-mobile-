import 'package:flutter/material.dart';
import 'package:quiz_application/answers_screen.dart';
import 'package:quiz_application/data/questions.dart';
import 'package:quiz_application/home_page.dart';
import 'package:quiz_application/quiz_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
//activeScreen value can be null in initial stage
  // Widget? activeScreen;
  var activeScreens = 'home_screen';
  final List<String> selectedAnswers = [];

//use to intiate methods, varibale when application start.excecute once.its a general initialization place.this use to lifting up the state.
  // @override
  // void initState() {
  //   activeScreen = HomePage(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(
      () {
        // activeScreen = const QuizScreen();
        activeScreens = 'quiz-screen';

        print('screen active!');
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == queations.length) {
      setState(() {
        activeScreens = 'answer-screen';
      });
    }
    print('answerList : $selectedAnswers');
  }

  void restartApp() {
    
    setState(() {
      selectedAnswers.clear();
      activeScreens = 'quiz-screen';
      print('restart');
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomePage(switchScreen);


    if (activeScreens == 'quiz-screen') {
      screenWidget = QuizScreen(
        onSelectanswer: chooseAnswer,
      );
    } else if (activeScreens == 'answer-screen') {
      screenWidget = AnswersScreen(
        restartApp,
        choosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 40, 61),
                Color.fromARGB(255, 0, 76, 121)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
