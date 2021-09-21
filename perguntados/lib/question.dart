class Question {
  late String question;
  late List<String> responses;
  late int correctResponse;
  Question(question, list, correct) {
    this.question = question;
    this.responses = list;
    this.correctResponse = correct;
  }
}
