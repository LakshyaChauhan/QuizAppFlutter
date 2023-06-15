import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FirstWidget extends StatelessWidget {
  FirstWidget(this.switchScreen, {super.key});

  void Function() switchScreen;

  @override
  Widget build(context) {
    return (Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(149, 255, 255, 255),
          ),
          const SizedBox(
            height: 60,
          ),
          // OutlinedButton.icon(
          //   onPressed: switchScreen,
          //   label: const Text('Start Quiz'),
          //   style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          //   icon: const Icon(Icons.arrow_right_alt),
          // ),
          CupertinoButton(
            onPressed: switchScreen,
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(255, 113, 23, 210),
            child: const Column(
              children: [Icon(Icons.arrow_right_alt), Text('Start Quiz ')],
            ),
          )
        ],
      ),
    ));
  }
}
