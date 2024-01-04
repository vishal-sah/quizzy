import "package:flutter/material.dart";
import "package:quizzy/data/questions.dart";
import 'questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final correctQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: 'You answered ',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: '$correctQuestion',
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  const TextSpan(
                    text: ' out of ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '$numTotalQuestions',
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  const TextSpan(
                    text: ' questions correctly!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero, // Set minimumSize to Size.zero
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8), // Adjust padding as needed
                ),
                onPressed: onRestart,
                child: const Row(
                  mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                  children: [
                    Icon(Icons.restart_alt_rounded),
                    Text('Restart Quiz!')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
