import 'package:flutter/material.dart';
import 'package:oranos_chat/presentation/style/color.dart';
import 'package:oranos_chat/presentation/style/text_style.dart';

class CustomizedText extends StatelessWidget {
  final String textContent;
  final Color textColor;
  final TextStyle textStyle;
  const CustomizedText(
      {super.key,
      required this.textContent,
      this.textColor = blackColor,
      this.textStyle = blackNormalText});

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,
      style: textStyle,
    );
  }
}
