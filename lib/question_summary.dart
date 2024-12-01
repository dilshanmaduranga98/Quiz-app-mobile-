import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(context) {
    Color getColor({data, correctColor, wrongColor}) {
      Color indexColor = Colors.blueAccent;

      if (data['user_answer'] == data['correct_answer']) {
        indexColor = correctColor;
      } else {
        indexColor = wrongColor;
      }
      return indexColor;
    }

    return SizedBox(
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Container(
              margin:const EdgeInsets.only(top: 20,),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: getColor(
                          data: data,
                          correctColor: const Color.fromARGB(255, 83, 207, 87),
                          wrongColor: const Color.fromARGB(255, 253, 52, 52),
                        ),
                        borderRadius: BorderRadius.circular(80)),
                    padding: const EdgeInsets.all(13),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: getColor(
                          data: data,
                          correctColor: const Color.fromARGB(0, 68, 137, 255),
                          wrongColor: const Color.fromARGB(106, 253, 52, 52),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 30, 191, 255),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
