import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  final String defaultMessage;
  TextEditingController textController = TextEditingController();
  CustomizedTextField({
    Key? key,
    required this.defaultMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: defaultMessage,
      controller: textController,
      keyboardType: TextInputType.name,
    );
  }
}
