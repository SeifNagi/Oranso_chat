import 'package:flutter/material.dart';
import 'package:oranos_chat/presentation/page/get_startedscreen.dart';
import '../style/text_style.dart';
import '../widget/customized_button.dart';
import '../widget/customized_text.dart';
import '../widget/customized_text_span.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/splash/splash_image.png'),
                fit: BoxFit.cover),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CustomizedTextSpan(
                    firstText: 'Oranso',
                    firstTextStyle: bigText,
                    secondText: '.',
                    secondTextStyle: tealBigText,
                  ),
                  CustomizedText(
                    textContent: 'Expert From Every Planet',
                    textStyle: greyNormalText,
                  ),
                ]),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 1.25,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomizedButton(
                        buttonText: 'Get Started',
                        navigationPath: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GetStartedScreen()),
                          );
                        }),
                  ),
                ),
              ],
            ),
            const CustomizedTextSpan(
                firstText: "Don't have an account?", secondText: 'SignUp'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Icon(Icons.language), Text('English')],
            )
          ]),
        )
      ],
    ));
  }
}
