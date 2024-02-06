import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:book_basket/Presentation/Screens/IntroScreen/onboarding_screen.dart';
import 'package:book_basket/Routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.to(OnboardingScreen()));
  }

  // super.initState();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      height: mq.height,
      width: mq.width,
      child: Image.asset(
        AppImages.splashScreen,
        fit: BoxFit.cover,
      ),
    )
        //floatingActionButton: FloatingActionButton(onPressed: (){},),
        );
  }
}
