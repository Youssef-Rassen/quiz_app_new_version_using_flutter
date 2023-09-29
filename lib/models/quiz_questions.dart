class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;
  List<String> getShuffledAnswers(){
   final List<String> shuffledList= List.of(answers);
   shuffledList.shuffle();
    return shuffledList;// to create a new list based on the original list of answers
    // so of() copy the original list to another list and the main list will be untouchable
    //final here doesn't give an error because we are not reassigning a value to shuffle  dList
  }
}
