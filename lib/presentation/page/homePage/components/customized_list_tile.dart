import 'package:flutter/material.dart';

import '../../../style/color.dart';

class CustomizedListTile extends StatelessWidget {
  final String imagePath;
  final String titleText;
  final String subtitleText;
  const CustomizedListTile(
      {super.key,
      required this.imagePath,
      required this.titleText,
      required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 1,
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1.0,
                  offset: Offset.fromDirection(120.0))
            ],
            borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Image.asset(imagePath),
          title: Text(
            titleText,
          ),
          subtitle: Text(subtitleText),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_outlined)),
        ),
      ),
    );
  }
}
