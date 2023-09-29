import 'package:flutter/material.dart';
import 'package:quizz_app_using_flutter/data/questions.dart';
import 'package:quizz_app_using_flutter/questions_screen.dart';
import 'first_screen.dart';
import 'results_screen.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});


  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
   List<String> selectedAnswers = [];

  // var activeScreen = const FirstScreen(); --> this line will give an error because activeScreen will be a type of FirstScreen
  // to fix this error:
  // we should change this var type to Widget type so it could accept all types of widgets
  // Widget? activeScreen; //? tells dart that this could be a widget or Null
  // we will get an error here because the initialization of the variable and method happens in the same time ,when the class is instantiated
  // to fix this error ----> we use initState method
  // @override
  // void initState() {
  //   // used to do extra initialization
  //   //executes first
  //   activeScreen = FirstScreen(switchScreen);
  //   super.initState();
  // }
  var activeScreen = 'start-screen';
  void switchScreen() {
    // to navigate between screens
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen='start-screen';
    });

  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length){
      setState(() {
        activeScreen='results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = FirstScreen(switchScreen);
    // using if condition
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if(activeScreen=='results-screen'){
      screenWidget =  ResultsScreen(chosenAnswers: selectedAnswers,onRestart: restartQuiz,);
    }

    // final startScreen=activeScreen == 'start-screen'
    //     ? FirstScreen(switchScreen)
    //     : const QuestionScreen(); // ternary operator means that if this activeScreen =='start-screen' then FirstScreen(switchScreen) after the : we define the else case

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 103, 60, 184),
                Color.fromARGB(255, 144, 105, 213),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget),
      ),
    );
  }
}
