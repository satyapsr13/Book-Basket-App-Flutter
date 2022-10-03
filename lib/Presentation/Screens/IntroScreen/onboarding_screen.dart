// ignore_for_file: prefer_const_constructors
import 'package:book_basket/Constants/colors.dart';
// import 'package:book_basket/Constants/AppImages.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
// scroll controller
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              PageView(
                children: [
                  Container(
                    width: mq.width * 0.8,
                    height: mq.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.onboarding_1,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      'Page 1',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    width: mq.width * 0.8,
                    height: mq.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.onboarding_1,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      'Page 2',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    width: mq.width * 0.8,
                    height: mq.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.onboarding_1,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      'Page 3',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    width: mq.width * 0.8,
                    height: mq.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.onboarding_1,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _pageController.nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.bounceInOut);
                      });
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
                ],
              ),
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
