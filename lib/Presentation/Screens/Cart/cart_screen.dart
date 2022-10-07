// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:book_basket/Constants/constants.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:book_basket/Presentation/Widgets/bottom_navigation_bar.dart';
import 'package:book_basket/Presentation/Widgets/coming_soon_label.dart';
import 'package:flutter/material.dart';

import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Presentation/Widgets/primary_button.dart';
import 'package:book_basket/Routes/routes.gr.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        // leading: const Icon(Icons.card_travel_outlined),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white, 
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          context.pushRoute(BookDetailsFormScreen());
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: AppColors.primaryColor,
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 3,
      ),
      body: isEmpty
          ? emptyCartWidget(mq, context)
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: 20,
                    itemBuilder: (ctx, index) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CartScreenWidget(
                        mq: mq,
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20);
                    },
                  ),
                ),
              ],
            ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  Column emptyCartWidget(Size mq, BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: mq.height * 0.1),
        Row(
          children: [
            const Spacer(),
            Text(
              'Your Cart is Empty!',
              style: const TextStyle(),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
          height: mq.height * 0.5,
          width: mq.width,
          child: Lottie.asset(AppLottie.emptyBasket, fit: BoxFit.cover),
        ),
        PrimaryButton(
          onPressed: () {
            context.pushRoute(HomeScreen());
          },
          buttonText: "Shop now",
          widthSize: mq.width * 0.5,
        )
      ],
    );
  }
}

class CartScreenWidget extends StatelessWidget {
  final Size mq;
  const CartScreenWidget({
    Key? key,
    required this.mq,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bookBackGroundColor = bookBackGroundColors[Random().nextInt(4)];
    var bookTitle = 'S CHAND CHEMISTRY PART 2';
    var bookClass = "Class 10th";
    var bookEdition = "2018-19";
    var productAddress = 'CC47+H2,Anand Nagar,';
    var bookPrice = '₹110';
    return Container(
      // width: mq.width * 0.85,
      height: mq.height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.grey)),
      child: Row(
        children: [
          Container(
            color: bookBackGroundColor,
            width: mq.width * 0.4,
            height: mq.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: mq.width * 0.3,
                  height: mq.height * 0.2,
                  child: Image.network(
                    'https://picsum.photos/200',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            // height: 50,
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookTitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xff3E4A59),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                bookClass,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xff3E4A59),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Edition: $bookEdition",
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xff3E4A59),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.location_city,
                      color: AppColors.primaryColor, size: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Text(
                        "${productAddress.substring(0, 10)} ...",
                        style: const TextStyle(),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 23,
                        // width: 75,
                        decoration: BoxDecoration(
                          color: bookBackGroundColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          children: [
                            FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  bookPrice,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 25,
                        // width: 75,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.white,
                            ),
                            FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Remove',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CommingSoonLabel(
                        child: Container(
                          height: 25,
                          // width: 75,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Row(
                            children: [
                              FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Chat now',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
