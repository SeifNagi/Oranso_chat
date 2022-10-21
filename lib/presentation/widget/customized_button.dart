import 'package:flutter/material.dart';
import 'package:oranos_chat/presentation/style/color.dart';

class CustomizedButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Function navigationPath;
  const CustomizedButton(
      {super.key,
      required this.buttonText,
      this.buttonColor = tealColor,
      required this.navigationPath});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        navigationPath();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
      ),
      child: Text(buttonText),
    );
  }
}
