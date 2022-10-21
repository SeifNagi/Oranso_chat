import 'package:flutter/material.dart';

import '../../../../data/dome_data.dart';
import '../../../style/color.dart';
import '../../../widget/customized_text.dart';

class OnlineExpertsContainer extends StatelessWidget {
  const OnlineExpertsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 8,
      child: ListView.builder(
        itemCount: onlineExperts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            textDirection: TextDirection.rtl,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 2, 5, 0),
                child: Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: height / 14,
                        width: height / 14,
                        decoration: BoxDecoration(
                            color: lightGreyColor,
                            borderRadius: BorderRadius.circular(24)),
                      ),
                    ],
                  ),
                  Text('${onlineExperts[index]['data']}')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
