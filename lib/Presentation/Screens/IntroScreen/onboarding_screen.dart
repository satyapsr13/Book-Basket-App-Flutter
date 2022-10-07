// ignore_for_file: prefer_const_constructors
import 'package:auto_route/auto_route.dart';
import 'package:book_basket/Constants/colors.dart';
// import 'package:book_basket/Constants/AppImages.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:book_basket/Routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
// scroll controller
  final PageController _pageController = PageController();
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
            visible: (index % 3) == 0,
            child: Container(
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
            visible: (index % 3) == 1,
            child: Container(
              width: mq.width * 0.8,
              height: mq.height * 0.4,
              child: Lottie.asset(AppLottie.chatting, fit: BoxFit.cover),
            ),
          ),
          Visibility(
            visible: (index % 3) == 2,
            child: Container(
              width: mq.width * 0.8,
              height: mq.height * 0.4,
              child: Lottie.asset(AppLottie.locationAnimation,
                  fit: BoxFit.cover),
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
            index % 3 == 0
                ? 'Purchasing and Selling of old books is possible at same platform.'
                : index % 3 == 1
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
                  size: (index % 3) != 0 ? 20 : 30,
                  color:
                      (index % 3) != 0 ? Colors.grey : AppColors.primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  size: (index % 3) != 1 ? 20 : 30,
                  color:
                      (index % 3) != 1 ? Colors.grey : AppColors.primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  size: (index % 3) != 2 ? 20 : 30,
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
                    context.replaceRoute(LoginScreen());
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
                    if ((index % 3) == 2) {
                      context.replaceRoute(LoginScreen());
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
  final Size mediaQuery;
  const OnboardingWidget({
    Key? key,
    required this.imageUrl,
    required this.description,
    required this.mediaQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQuery.height * 0.5,
      width: mediaQuery.width,
      child: Column(
        children: [
          SizedBox(
            height: mediaQuery.height * 0.4,
            width: mediaQuery.width,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.1,
            width: mediaQuery.width,
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
