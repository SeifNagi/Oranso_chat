abstract class ChatStates {}

class ChatInitialState extends ChatStates {}

class ChatAnotherQuestionState extends ChatStates {}

class ChatLastQuestionState extends ChatStates {}

class ChatErrorState extends ChatStates {
  final String error;
  ChatErrorState(this.error);
}
