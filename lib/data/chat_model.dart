class RobotQuestionModel {
  final String message;
  final String source;
  RobotQuestionModel({required this.message, this.source = 'bot'});
}

class ChatCheckboxQuestionModel {
  final String question;
  bool isSelected;
  ChatCheckboxQuestionModel({required this.question, this.isSelected = false});
}
