// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Constants/constants.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:book_basket/Presentation/Screens/Cart/cart_screen.dart';
import 'package:book_basket/Presentation/Widgets/bottom_navigation_bar.dart';
import 'package:book_basket/Routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String userName = 'Afdsfa';
  bool isFilterActive = false;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    var userName = 'Abhishek Singh Lodhi';
    var userEmail = 'abhisheksinghlodhi902@gmail.com';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Profile'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                size: 25,
              )),
        ],
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
        currentIndex: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.primaryColor,
              child: Text(
                userName.toString().substring(0, 1),
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(Icons.person,
                            size: 20, color: Color(0xff3E4A59)),
                      ),
                      Text(
                        userName,
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xff3E4A59)),
                      ),
                    ],
                  ),
                  // SizedBox(height: 5),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(Icons.mail,
                            size: 20, color: Color(0xff3E4A59)),
                      ),
                      Text(
                        userEmail,
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xff3E4A59)),
                      ),
                    ],
                  ),
                  // SizedBox(height: 5),/
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(Icons.location_history),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '461001',
                            style: const TextStyle(),
                          ),
                          Text(
                            'Sadar bazar,Hoshangabad',
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(height: 5),
                ],
              ),
            ),
            SizedBox(height: 5),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Positioned(
                  bottom: -20,
                  left: mq.width * 0.15,
                  child: Container(
                    width: mq.width * 0.7,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            width: 2, color: Colors.grey.withOpacity(0.5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isFilterActive = true;
                            });
                          },
                          child: Text(
                            'Books on Sell',
                            style: TextStyle(
                              color: isFilterActive
                                  ? const Color(0xff428DFC)
                                  : const Color(0xff3E4A59),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          width: 1,
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isFilterActive = false;
                            });
                          },
                          child: Text(
                            'Sold Books ',
                            style: TextStyle(
                              color: !isFilterActive
                                  ? const Color(0xff428DFC)
                                  : const Color(0xff3E4A59),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: BookOnSellWidget(mq: mq),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20);
                },
              ),
            ),
            // SizedBox(height: 20),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}

class BookOnSellWidget extends StatelessWidget {
  final Size mq;
  const BookOnSellWidget({
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
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
                          width: 75,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Remove from sell',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 25,
                          // width: 75,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Row(
                            children: const [
                              FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Mark as Sold',
                                    style: TextStyle(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
