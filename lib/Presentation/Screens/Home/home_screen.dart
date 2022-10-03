import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('appbar'),
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
      body: const Text(
        'lorem',
        style: TextStyle(),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
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
