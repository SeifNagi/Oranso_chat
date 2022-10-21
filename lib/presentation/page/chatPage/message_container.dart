import 'package:flutter/material.dart';

import '../../../data/chat_model.dart';
import '../../style/color.dart';

class UserMessageContainer extends StatelessWidget {
  final int questionNumber;
  const UserMessageContainer(
      {super.key, required this.response, required this.questionNumber});
  final List<RobotQuestionModel> response;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      //color: Colors.amber,
      width: width,
      height: questionNumber == 3 ? height - 300 : height - 100,
      child: ListView.builder(
          itemCount: response.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: response[index].source == 'bot'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(response[index].message),
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
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(response[index].message,
                                  style: const TextStyle(color: whiteColor)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child:
                                Image.asset('assets/getStarted/seen_icon.png'),
                          ),
                        ],
                      ),
              )),
    );
  }
}
