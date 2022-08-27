// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

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

Map<String, int> dayToIntConverter = {
  'All Days':0,
  'Monday':1,
  'Tuesday':2,
  'Wednesday':3,
  'Thursday':4,
  'Friday':5,
  'Saturday':6,
  'Sunday':7,
};
