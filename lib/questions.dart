import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/answerbutton.dart';
import 'package:quizapp/questionslist.dart';


class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<Questions> createState() {
    return _Questions();
  }
}

class _Questions extends State<Questions> {
  var index = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      index++;
    });
  }

  @override
  Widget build(context) {
    final question = questionsList[index];
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question.text,
                style: GoogleFonts.lato(
                    fontSize: 24,
                    color: const Color.fromARGB(255, 220, 146, 255),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              ...question.shuffledAnswers().map((answer) {
                return AnswerButton(
                    text: answer,
                    onTap: () {
                      answerQuestion(answer);
                    });
              }),
            ]),
      ),
    );
  }
}
