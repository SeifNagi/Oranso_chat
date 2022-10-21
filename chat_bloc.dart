import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos_chat/bloc/chat_state.dart';
import 'package:oranos_chat/data/chat_model.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());
  static ChatCubit get(context) => BlocProvider.of(context);
  late String fName;
  late String lName;
  int questionNumber = 0;
  final List<RobotQuestionModel> robotConversation = [
    RobotQuestionModel(message: "Hi, Whats Your First Name?"),
  ];
  final List<ChatCheckboxQuestionModel> categoryQuestion = [
    ChatCheckboxQuestionModel(question: 'Information Technology'),
    ChatCheckboxQuestionModel(question: 'Human Resources'),
    ChatCheckboxQuestionModel(question: 'Translation'),
    ChatCheckboxQuestionModel(question: 'Bussiness Research'),
    ChatCheckboxQuestionModel(question: 'Security'),
  ];
  void addQuestion(
      {required TextEditingController userResponse, required String source}) {
    robotConversation
        .add(RobotQuestionModel(message: userResponse.text, source: source));
    if (questionNumber == 0) {
      fName = userResponse.text;
      robotConversation.add(RobotQuestionModel(
          message: 'Ok, $fName What is your last name?', source: 'bot'));
      questionNumber++;
    } else if (questionNumber == 1) {
      lName = userResponse.text;
      robotConversation.add(RobotQuestionModel(
          message: "Mr $fName $lName, What's your Title?", source: 'bot'));
      questionNumber++;
    } else if (questionNumber == 2) {
      robotConversation.add(RobotQuestionModel(
          message: "What category you will need expert in", source: 'bot'));
      questionNumber++;
    } else if (questionNumber == 3) {
      questionNumber++;
      emit(ChatLastQuestionState());
    }
    emit(ChatAnotherQuestionState());
  }
}
