// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});

  final void Function() onTap;
  final String text;
  @override
  Widget build(context) {
    return
        // CupertinoButton(
        //   onPressed: () {},
        //   borderRadius: BorderRadius.circular(100),
        //   color: const Color.fromARGB(255, 113, 23, 210),
        //   alignment: Alignment.center,
        //   child: Text(text),
        // )
        Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 113, 23, 210),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
