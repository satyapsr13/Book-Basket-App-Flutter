import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nhsbpmonitor/Presentation/Widgets/gradient_screen_widget.dart';

import 'package:nhsbpmonitor/Routes/routes.gr.dart';
import 'package:nhsbpmonitor/constants/locations.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  // void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return GradientScreen(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _whiteLogoImage(),
            SizedBox(height: mediaquery.height * 0.15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                tr('are_you_a'),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            textButton(tr("patient"), () {
              context.pushRoute(const AccessCodeScreen());
              // context.pushRoute(route);
            }),
            // textButton(tr("med_wife"), () {
            //   context.pushRoute(const SignInWithUserName());
            // }),
            // textButton(tr("doctor"), () {
            //   context.pushRoute(const SignInWithUserName());
            //   // context.pushRoute(const HomeScreen());
            // }),
          ],
        ),
      ),
    );
  }

  Image _whiteLogoImage() {
    return Image.asset(
      AssetImages.whiteLogo,
      height: 150,
      width: 150,
    );
  }

  TextButton textButton(String title, void Function() onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 60),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
