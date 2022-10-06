// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor =Color.fromARGB(255, 123, 8, 254);
}

LinearGradient linearGradient() {
  return LinearGradient(
    colors: [
      Color(0xff30AEBA).withOpacity(0.6),
      Color(0xff0072BC).withOpacity(0.6),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: const [0, 1],
  );
}
