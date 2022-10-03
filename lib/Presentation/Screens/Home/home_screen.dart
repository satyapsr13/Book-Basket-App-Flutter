import 'package:book_basket/Constants/locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      // extendBody: true,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        // excludeHeaderSemantics: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
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
                    children: const [
                      Text(
                        'Sadar Bazar,461001',
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
                Icons.notification_important,
                color: Colors.white,
                size: 20,
              )),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: mq.width,
            // height: mq.height * 0.3,
            child: Image.asset(
              AppImages.carousel_1,
              fit: BoxFit.contain,
            ),
          ),
          // Expanded(
          //   child: FlutterCarousel(
          //     items: [
          //       Container(
          //         width: mq.width,
          //         // height: mq.height * 0.3,
          //         child: Image.asset(
          //           AppImages.carousel_2,
          //           fit: BoxFit.contain,
          //         ),
          //       ),
          //       Container(
          //         width: mq.width,
          //         // height: mq.height * 0.4,
          //         child: Image.asset(
          //           AppImages.carousel_2,
          //           fit: BoxFit.contain,
          //         ),
          //       ),
          //     ],
          //     // carouselController: buttonCarouselController,
          //     options: CarouselOptions(
          //       autoPlay: true,
          //       enlargeCenterPage: true,
          //       // viewportFraction: 0.9,
          //       // aspectRatio: 2.0,
          //       autoPlayAnimationDuration: const Duration(seconds: 2),

          //       initialPage: 0,
          //     ),
          //   ),
          // ),

          const Text(
            'lorem',
            style: TextStyle(),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){},),
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
    return Container(
      height: 100,
      width: 100,
      color: Colors.green,
      child: const Center(
        child: Text('suggestions'),
      ),
    );
    // throw UnimplementedError();
  }
}
