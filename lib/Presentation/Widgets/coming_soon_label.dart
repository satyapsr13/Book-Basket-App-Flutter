// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class CommingSoonLabel extends StatelessWidget {
  // const CommingSoonLabel({Key? key}) : super(key: key);
  final Widget child;
  const CommingSoonLabel({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          right: -10,
          top: -10,
          child: Container(
            height: 18,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Coming Soon',
                style: const TextStyle(color: Colors.black, fontSize: 8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
