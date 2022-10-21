import 'package:flutter/material.dart';
import 'package:oranos_chat/presentation/style/text_style.dart';

class CustomizedTextSpan extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;
  final TextStyle firstTextStyle;
  final TextStyle secondTextStyle;
  const CustomizedTextSpan(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.firstTextStyle = blackSmallText,
      this.secondTextStyle = tealSmallText,
      this.thirdText = ''});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(text: firstText, style: firstTextStyle, children: <InlineSpan>[
      TextSpan(
        text: secondText,
        style: secondTextStyle,
      ),
      TextSpan(
        text: thirdText,
        style: firstTextStyle,
      ),
    ]));
  }
}
