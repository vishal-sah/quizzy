import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align items to the start
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20), // Add space to the right of the index
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['user_answer'] == data['correct_answer']
                            ? Colors.green
                            : Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align items to the start
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'User Answer: ${data['user_answer'] as String}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue, // Change color to blue
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                        Text(
                          'Correct Answer: ${data['correct_answer'] as String}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green, // Change color to green
                            fontStyle: FontStyle.italic, // Make text italic
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
