import 'package:flutter/material.dart';
import 'package:oranos_chat/presentation/style/color.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import '../../../../data/dome_data.dart';
import 'customized_list_tile.dart';

class CustomizedDraggableSheet extends StatelessWidget {
  final ScrollController controller;
  const CustomizedDraggableSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      //color: Colors.white,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: lightGreyColor),
          borderRadius: BorderRadius.circular(12)),
      child: ListView.builder(
          controller: controller,
          itemCount: bottomSheet_data.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  SizedBox(
                      width: width / 6,
                      child: const Divider(
                        thickness: 5,
                        color: lightGreyColor,
                      )),
                  CustomizedListTile(
                      imagePath: bottomSheet_data[0]['image'],
                      titleText: bottomSheet_data[0]['title'],
                      subtitleText:
                          '${bottomSheet_data[0]['subtitle']} Experts')
                ],
              );
            }

            return CustomizedListTile(
                imagePath: bottomSheet_data[index]['image'],
                titleText: bottomSheet_data[index]['title'],
                subtitleText: '${bottomSheet_data[index]['subtitle']} Experts');
          }),
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:oranos_chat/presentation/style/color.dart';
import '../../../../data/dome_data.dart';
import 'customized_list_tile.dart';

class CustomizedDraggableSheet extends StatelessWidget {
  const CustomizedDraggableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlidingSheet(
        child: DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.0,
            maxChildSize: 1.0,
            builder: ((context, scrollController) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: bottomSheet_data.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return (Column(
                          children: [
                            const SizedBox(
                              width: 50,
                              child: Divider(
                                thickness: 5,
                                color: lightGreyColor,
                              ),
                            ),
                            CustomizedListTile(
                                imagePath: bottomSheet_data[0]['image'],
                                titleText: bottomSheet_data[0]['title'],
                                subtitleText:
                                    '${bottomSheet_data[0]['subtitle']} Experts')
                          ],
                        ));
                      }
                      return CustomizedListTile(
                          imagePath: bottomSheet_data[index]['image'],
                          titleText: bottomSheet_data[index]['title'],
                          subtitleText:
                              '${bottomSheet_data[index]['subtitle']} Experts');
                    })))),
      ),
    );
  }
}


 */