// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.startQuiz,
      {super.key}); // we are passing a parameter of type function to firstScreen so we can connect the first_screen with the question_screen

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            // to make this image transparency, we use Opacity widget (but it's not recommended)
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255,
                255), // the other way to create a transparency image (recommended)
          ),

          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(// to make this image transparency, we use Opacity widget (but it's not recommended)
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 80,
          ),
           Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            // same as outlinedButton but difference is on design
            onPressed: () {
              startQuiz();
              // Do something when the button is pressed
            },
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Start Quiz'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 61, 25, 128),
            ),
          )
        ],
      ),
    );
  }
}
