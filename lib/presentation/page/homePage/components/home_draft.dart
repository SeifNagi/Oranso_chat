import 'package:flutter/material.dart';
import 'package:oranos_chat/presentation/page/homePage/components/customized_draggable_sheet.dart';
import 'package:oranos_chat/presentation/page/homePage/components/online_experts_containers.dart';
import 'package:oranos_chat/presentation/page/homePage/components/recomended_experts_containers.dart';
import '../../../style/color.dart';
import '../../../style/text_style.dart';
import '../../../widget/customized_text.dart';
import '../../../widget/customized_text_span.dart';

class HomeDraft extends StatelessWidget {
  const HomeDraft({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leadingWidth: 30,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            'assets/home/avatar_image.png',
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 9.0),
          child: CustomizedTextSpan(
            firstText: 'Oranso',
            firstTextStyle: blackBolNormalText,
            secondText: '.',
            secondTextStyle: tealBigText,
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: blackColor,
          )
        ],
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomizedText(
                    textContent: 'Recomended Experts',
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                      ))
                ],
              ),
              const RecomendedExpertsContainer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomizedText(
                    textContent: 'Online Experts',
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                      ))
                ],
              ),
              const OnlineExpertsContainer(),
            ],
          ),
        ),
        DraggableScrollableSheet(
            maxChildSize: 0.8,
            minChildSize: 0.1,
            initialChildSize: 0.2,
            builder: (context, controller) =>
                CustomizedDraggableSheet(controller: controller))
      ]),
    );
  }
}
