// ignore_for_file: prefer_const_constructors
import 'package:book_basket/Constants/colors.dart';
// import 'package:book_basket/Constants/AppImages.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

// scroll controller

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              PageView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.onboarding_1,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.onboarding_1,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 5),
                          curve: Curves.bounceInOut);
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

  // @override
  // Widget build(BuildContext context) {
  //   final mediaquery = MediaQuery.of(context).size;
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('appbar'),
  //     ),
  //     body: SizedBox(
  //       width: mediaquery.width,
  //       height: mediaquery.height,
  //       child: Column(
  //         children: [
  //           SizedBox(
  //             height: mediaquery.height * 0.6,
  //             child: ListView(scrollDirection: Axis.horizontal, children: [
  //               OnboardingWidget(
  //                 description: '',
  //                 mediaQuery: mediaquery,
  //                 imageUrl: AppImages.onboarding_1,
  //               ),
  //               OnboardingWidget(
  //                 description: '',
  //                 mediaQuery: mediaquery,
  //                 imageUrl: AppImages.onboarding_1,
  //               ),
  //               OnboardingWidget(
  //                 description: '',
  //                 mediaQuery: mediaquery,
  //                 imageUrl: AppImages.onboarding_1,
  //               ),
  //             ]),
  //           ),
  //           Row(
  //             children: [
  //               const Spacer(),
  //               IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(
  //                     Icons.circle,
  //                     size: 10,
  //                   )),
  //               IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(
  //                     Icons.circle,
  //                     size: 10,
  //                   )),
  //               IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(
  //                     Icons.circle,
  //                     size: 10,
  //                   )),
  //               const Spacer(),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //     //floatingActionButton: FloatingActionButton(onPressed: (){},),
  //   );
  // }

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
