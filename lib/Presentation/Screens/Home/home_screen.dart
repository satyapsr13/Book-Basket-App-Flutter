// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Constants/constants.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:book_basket/Presentation/Widgets/bottom_navigation_bar.dart';
import 'package:book_basket/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isFilterActive = false;
  int t = 0;


  bool showFilterButton = true;
  List<String> indianCitiesList = [
    "Bhopal",
    "Indore",
    "Bengaluru",
    "Mumbai",
    "Delhi",
    "Kolkata",
    "Chennai",
    "Pune",
    "Jaipur",
    "Lucknow",
    "Kanpur",
    "Nagpur",
    "Patna",
    "Agra",
    "Vadodara",
    "Ghaziabad",
    "Ludhiana",
    "Coimbatore",
    "Madurai",
    "Nashik"
  ];

  @override
  void initState() {
    // TODO: implement initState
    // fun2();
    // log("-----------------middle----------");

    // fun1();
    Timer.periodic(Duration(seconds: 20), (timer) {
      setState(() {
        t++;
      });
    });

    super.initState();
  }

  String userAddress = 'Sadar Bazar,';
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(

      extendBodyBehindAppBar: true,

      appBar: AppBar(
         automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: InkWell(
          onTap: () {
            // model bottom sheet
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                // rounded shape
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (context) => Container(
                      height: mq.height * 0.75,
                      color: Colors.white.withOpacity(0.1),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Select Location",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: indianCitiesList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      setState(() {
                                        userAddress = indianCitiesList[index];
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    title: Text(
                                      indianCitiesList[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 16),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ));
          },
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.location_city_rounded),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "$userAddress , 461001",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Icon(Icons.arrow_drop_down_rounded),
                    ],
                  ),
                  Text(
                    '6c8w+jff,Sadar Bazar,Hoshangabad',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchScreen(),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 20,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 20,
              )),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          context.pushRoute(BookDetailsFormRoute());
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: AppColors.primaryColor,
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 0,
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: mq.width,
                height: mq.height * 0.3,
                child: Image.asset(
                  (t & 1) == 0 ? AppImages.carousel_1 : AppImages.carousel_2,
                  fit: BoxFit.cover,
                ),
              ),
              Visibility(
                visible: showFilterButton,
                child: Positioned(
                  bottom: -25,
                  left: mq.width * 0.3 / 2,
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
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                AppIcons.newLabel,
                                height: 21,
                                width: 20,
                                color: isFilterActive
                                    ? const Color(0xff428DFC)
                                    : const Color(0xff3E4A59),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isFilterActive = true;
                                });
                              },
                              child: Text(
                                'Latest Book',
                                style: TextStyle(
                                  color: isFilterActive
                                      ? const Color(0xff428DFC)
                                      : const Color(0xff3E4A59),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black,
                          width: 1,
                          height: 30,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                AppIcons.newLabel,
                                height: 21,
                                width: 20,
                                color: !isFilterActive
                                    ? const Color(0xff428DFC)
                                    : const Color(0xff3E4A59),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isFilterActive = false;
                                });
                              },
                              child: Text(
                                'All Books',
                                style: TextStyle(
                                  color: !isFilterActive
                                      ? const Color(0xff428DFC)
                                      : const Color(0xff3E4A59),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              clipBehavior:Clip.hardEdge,
              itemCount: 20,
              itemBuilder: (ctx, index) => InkWell(
                onTap: () {
                  context.pushRoute(BookDetailsRoute());
                },
                child: BooksWidget(
                  bookImageUrl: 'https://picsum.photos/200',
                  bookBackGroundColors: bookBackGroundColors[index % 4]!,
                  bookPrice: 5 + index,
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            ),
          ),
          // SizedBox(height: 40),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}

class BooksWidget extends StatelessWidget {
  // const BooksWidget({Key? key}) : super(key: key);
  final String bookImageUrl;
  final Color bookBackGroundColors;
  final num bookPrice;
  BooksWidget({
    Key? key,
    required this.bookImageUrl,
    required this.bookBackGroundColors,
    required this.bookPrice,
  }) : super(key: key);
  String bookTitle = 'ALL IN ONE ENGLISH CORE';
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: mq.width * 0.4,
                // height: mq.height * 0.4,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: mq.width * 0.4,
                      // height: mq.height * 0.15,
                      decoration: BoxDecoration(
                        color: bookBackGroundColors,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          SizedBox(
                            width: mq.width * 0.25,
                            height: mq.width * 0.25,
                            child: Image.network(
                              bookImageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      bookTitle,
                      style: const TextStyle(fontSize: 10),
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Class 12th",
                              style: const TextStyle(fontSize: 10),
                            ),
                            Text(
                              "edition: 2018-19",
                              style: const TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                            color: bookBackGroundColors,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                '₹ $bookPrice',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.pushRoute(CartRoute());
                          },
                          child: Container(
                            height: 25,
                            // width: 75,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.shopping_bag,
                                  size: 15,
                                ),
                                FittedBox(
                                  child: Text(
                                    'Add to Cart',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            // width: 75,
                            decoration: BoxDecoration(
                              color: Color(0xff428DFC),
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
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];

    // throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: const Icon(Icons.arrow_back));

    // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: const Center(
        child: Text('result'),
      ),
    );
    // throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Expanded(
      child: Container(
        // height: 100,
        // width: 100,
        // color: Colors.,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    TextButton(
                      onPressed: () {
                        query = 'NCERT class 12th';
                      },
                      child: Text(
                        'NCERT class 12th',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        query = 'NCERT class 11th';
                      },
                      child: Text(
                        'NCERT class 11th',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        query = 'NCERT class 10th';
                      },
                      child: Text(
                        'NCERT class 10th',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        query = 'NCERT class 9th';
                      },
                      child: Text(
                        'NCERT class 9th',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
    // throw UnimplementedError();
  }
}
