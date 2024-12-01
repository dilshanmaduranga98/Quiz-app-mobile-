import 'package:flutter/material.dart';
import 'package:quiz_application/data/questions.dart';
import 'package:quiz_application/question_summary.dart';

class AnswersScreen extends StatelessWidget {
  const AnswersScreen(this.restart, {super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;
  final void Function() restart;

  List<Map<String, Object>> getSummerryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': queations[i].question,
          'correct_answer': queations[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final totalQuestions = queations.length;
    final summaryData = getSummerryData();

    final numOfCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    final totalPoints = numOfCorrectAnswers * 10;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You answered $numOfCorrectAnswers out of $totalQuestions questions correctly!',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Total Points :  $totalPoints',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: QuestionSummary(summaryData),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: restart,
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.white,
              ),
              iconAlignment: IconAlignment.end,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 2,
                ),
              ),
              label: const Text(
                'Restart quiz',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
