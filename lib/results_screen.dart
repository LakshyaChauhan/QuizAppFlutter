import 'package:flutter/material.dart';
import 'package:quizapp/questions_summary.dart';
import 'package:quizapp/questionslist.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswer, required this.changeScreen});

  final List<String> chosenAnswer;

  final void Function() changeScreen;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questionsList[i].text,
        'correct_answer': questionsList[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestion = chosenAnswer.length;
    final correctAnswer = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You gave $correctAnswer write answers and $totalQuestion wrong answers.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(125, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: changeScreen,
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }
}
