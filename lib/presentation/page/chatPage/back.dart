import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos_chat/bloc/chat_bloc.dart';
import 'package:oranos_chat/presentation/style/color.dart';

class ChatScreenA extends StatefulWidget {
  const ChatScreenA({super.key});

  @override
  State<ChatScreenA> createState() => _ChatScreenStateA();
}

class _ChatScreenStateA extends State<ChatScreenA> {
  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    List chat = [
      {
        'message': "HI",
        'from': 'user',
      },
      {
        'message': "How can i help you?",
        'from': 'bot',
      },
      {
        'message': "HI",
        'from': 'user',
      },
      {
        'message': "How can i help you?",
        'from': 'bot',
      }
    ];
    return Scaffold(
      body: BlocProvider(
          create: (context) => ChatCubit(),
          child: Builder(builder: (context) {
            ChatCubit conversation = ChatCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: chat.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: chat[index]['from'] == 'user'
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor: Colors.black12,
                                              child: Image.asset(
                                                  'assets/getStarted/robot_icon.png'),
                                            ),
                                          ),
                                          Container(
                                            width: width / 1.5,
                                            decoration: BoxDecoration(
                                                color: lightGreyColor,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                '${chat[index]['message']}',
                                              ),
                                            ),
                                          ),
                                        ])
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: width / 1.5,
                                          decoration: BoxDecoration(
                                              color: tealColor,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              '${chat[index]['message']}',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                              'assets/getStarted/seen_icon.png'),
                                        ),
                                      ],
                                    ),
                            )),
                  ),
                ],
              ),
            );
          })),
      bottomSheet: Padding(
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
          onTap: () {
            messageController.text = '';
          },
        ),
      ),
    );
  }
}
