// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('appbar'),
      ),
      body: Text(
        'lorem',
        style: const TextStyle(),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
