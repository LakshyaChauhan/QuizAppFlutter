import 'package:flutter/material.dart';
import 'package:quizapp/first_widget.dart';
import 'package:quizapp/questions.dart';
import 'package:quizapp/questionslist.dart';
import 'package:quizapp/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
//////////////////////////////////////////////////////////////////////////////////

  var activeScreen = 'First-widget';
  List<String> chosenAnswer = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'QuestionWidget';
    });
  }

  void switchScreen2() {
    setState(() {
      chosenAnswer = [];
      activeScreen = 'First-widget';
    });
  }

  void onChosenAnswers(String answer) {
    chosenAnswer.add(answer);
    if (chosenAnswer.length == questionsList.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

///////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(context) {
    Widget startScreen = FirstWidget(switchScreen);
    if (activeScreen == 'QuestionWidget') {
      startScreen = Questions(onSelectedAnswer: onChosenAnswers);
    }
    if (activeScreen == 'results-screen') {
      startScreen = ResultsScreen(
        chosenAnswer: chosenAnswer,
        changeScreen: switchScreen2,
      );
    }
    if (activeScreen == 'First-widget') {
      startScreen = FirstWidget(switchScreen);
    }

    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: startScreen,
      )),
    ));
  }
}
