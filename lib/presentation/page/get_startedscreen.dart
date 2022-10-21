import 'package:flutter/material.dart';
import 'package:oranos_chat/presentation/page/chatPage/chat_screen.dart';

import '../style/text_style.dart';
import '../widget/customized_button.dart';
import '../widget/customized_text_span.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const CustomizedTextSpan(
                          firstText: 'Hi, My name is ',
                          firstTextStyle: blackNormalText,
                          secondText: 'Oranobot \n',
                          secondTextStyle: blackNormalBoldText,
                          thirdText:
                              'I will always be there to \n help and assist you \n\nSay Start To go to Next.',
                        ),
                        Image.asset('assets/getStarted/message_image.png')
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset('assets/getStarted/robot_image.png'),
              Column(
                children: [
                  SizedBox(
                    width: width / 3,
                    child: CustomizedButton(
                        buttonText: 'Next',
                        navigationPath: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatScreen()),
                          );
                        }),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Icon(Icons.language), Text('English')],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
