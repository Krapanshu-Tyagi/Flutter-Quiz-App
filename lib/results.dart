import 'package:flutter/material.dart';
import 'package:quiz_app/data/QnA.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/questions_sumary.dart';

class Results extends StatelessWidget {
  const Results(this.chosenAnswer, {super.key});

  final List<String> chosenAnswer;
  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!'),
            QuestionsSumary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz")),
          ],
        ),
      ),
    );
  }
}
