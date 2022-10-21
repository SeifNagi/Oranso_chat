import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos_chat/bloc/chat_bloc.dart';
import 'package:oranos_chat/presentation/page/chatPage/message_container.dart';
import 'package:oranos_chat/presentation/style/text_style.dart';
import '../../../../presentation/page/homePage/components/bottom_nav.dart';
import 'package:oranos_chat/presentation/style/color.dart';
import '../../../bloc/chat_state.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      body: BlocProvider(
        create: (context) => ChatCubit(),
        child: Builder(builder: (context) {
          ChatCubit conversationCubit = ChatCubit.get(context);
          return SingleChildScrollView(
            child: BlocConsumer<ChatCubit, ChatStates>(
              listener: (context, state) {
                if (conversationCubit.questionNumber == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavBar()),
                  );
                }
              },
              builder: (context, state) => Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      UserMessageContainer(
                          response: conversationCubit.robotConversation,
                          questionNumber: conversationCubit.questionNumber),
                      conversationCubit.questionNumber == 3
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ...conversationCubit.categoryQuestion
                                        .map((value) {
                                      return Row(
                                        children: [
                                          Checkbox(
                                              shape: const CircleBorder(),
                                              value: value.isSelected,
                                              onChanged: (val) {
                                                value.isSelected = val!;
                                                setState(() {});
                                              },
                                              activeColor: value.isSelected
                                                  ? tealColor
                                                  : lightGreyColor,
                                              checkColor: Colors.white),
                                          Text(value.question),
                                        ].toList(),
                                      );
                                    }),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Say Done or press send to Apply',
                                        style: greyNormalText,
                                      ),
                                    ),
                                  ]),
                            )
                          : Container(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Text something..',
                              suffixIcon: const Icon(Icons.send),
                              prefixIcon: const Icon(
                                Icons.language_outlined,
                              )),
                          controller: messageController,
                          onSubmitted: (value) {
                            conversationCubit.addQuestion(
                                userResponse: messageController,
                                source: 'user');
                            messageController.text = '';
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
