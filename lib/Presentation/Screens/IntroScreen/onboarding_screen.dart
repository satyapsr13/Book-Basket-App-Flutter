// ignore_for_file: prefer_const_constructors
import 'package:auto_route/auto_route.dart';
import 'package:book_basket/Constants/colors.dart';
// import 'package:book_basket/Constants/AppImages.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:book_basket/Presentation/Screens/Auth/log_in.dart';
import 'package:book_basket/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
// scroll controller
  bool isVisible(int widgetIndex, int currentIndex) {
    return (currentIndex % 3) == widgetIndex;
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      persistentFooterButtons: [
        skipAndNextButton(mq, context),
      ],
      body: Column(
        children: [
          // SizedBox(height: 50),
          SizedBox(height: mq.height * 0.08),
          Visibility(
            visible: isVisible(0, index),
            child: SizedBox(
              width: mq.width,
              height: mq.height * 0.4,
              child: Center(
                  child: Lottie.asset(
                AppLottie.shareBookMoney,
                fit: BoxFit.fitHeight,
              )),
            ),
          ),
          Visibility(
            visible: isVisible(1, index),
            child: SizedBox(
              width: mq.width * 0.8,
              height: mq.height * 0.4,
              child: Lottie.asset(AppLottie.chatting, fit: BoxFit.cover),
            ),
          ),
          Visibility(
            visible: isVisible(2, index),
            child: SizedBox(
              width: mq.width * 0.8,
              height: mq.height * 0.4,
              child:
                  Lottie.asset(AppLottie.locationAnimation, fit: BoxFit.cover),
            ),
          ),
          // SizedBox(),
        ],
      ),
    );
  }

  Center skipAndNextButton(Size mq, BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            isVisible(0, index)
                ? 'Purchasing and Selling of old books is possible at same platform.'
                : isVisible(1, index)
                    ? "Personalised chat option with the each seller."
                    : " No delivery charges issues to buy and sell books. Find books nearby you in your city.",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xff3E4A59),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  size: (index % 3) != 0 ? 17 : 25,
                  color:
                      (index % 3) != 0 ? Colors.grey : AppColors.primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  size: (index % 3) != 1 ? 17 : 25,
                  color:
                      (index % 3) != 1 ? Colors.grey : AppColors.primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  size: (index % 3) != 2 ? 17 : 25,
                  color:
                      (index % 3) != 2 ? Colors.grey : AppColors.primaryColor,
                ),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(height: 25),
          Container(
            width: mq.width,
            height: 100,
            color: Colors.white,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(
                  flex: 1,
                ),
                MaterialButton(
                  onPressed: () {
                    context.replaceRoute(LoginRoute());
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                MaterialButton(
                  onPressed: () {
                    if ((isVisible(2, index))) {
                      // context.replaceRoute(LoginRoute());
                      Get.to(LoginScreen());
                    } else {
                      setState(() {
                        index++;
                      });
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  // const OnboardingWidget({Key? key}) : super(key: key);
  final String imageUrl;
  final String description;
  final Size mq;
  const OnboardingWidget({
    Key? key,
    required this.imageUrl,
    required this.description,
    required this.mq,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mq.height * 0.5,
      width: mq.width,
      child: Column(
        children: [
          SizedBox(
            height: mq.height * 0.4,
            width: mq.width,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: mq.height * 0.1,
            width: mq.width,
            child: Text(
              description,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
