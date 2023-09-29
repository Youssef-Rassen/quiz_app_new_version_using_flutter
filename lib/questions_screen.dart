import 'package:flutter/material.dart';
import 'package:quizz_app_using_flutter/answer_button.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {

  @override
  State<QuestionScreen> createState() => _QuestionScreenSate();
  const QuestionScreen({super.key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
}

class _QuestionScreenSate extends State<QuestionScreen> {
  var currentQuestionIndex=0;

   void answerQuestion(String selectedAnswer){
     widget.onSelectAnswer(selectedAnswer);
     setState((){
       currentQuestionIndex++;
     });

  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        // same as first_question screen but changing the wrapping with center to a sizedBox
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center ,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(buttonText: answer, onTap: (){
                answerQuestion(answer);

              } );// convert a list of strings to a list of  AnswerButton
            }),// map helps to convert the values in a list to other values
            // we got an error here because there is a nested list so that the children needs values, so to fix this we have to do Spreading, so that the answerButton are pulled out and treated as values inside a list
          ],
        ),
      ),
    );
  }
}
// map() doesn't change the original list ,but shuffle() does