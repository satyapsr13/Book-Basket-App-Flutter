import 'package:flutter/material.dart';

const String addTodoRoute = "/add";
const String editTodoRoute = "/edit";

const colors = {
  "success": 0xff3ec11c,
  "error": 0xffeb614d,
};

Map<int, String> intToMonth = {
  1: "Jan",
  2: "Feb",
  3: "Mar",
  4: "Apr",
  5: "May",
  6: "Jun",
  7: "Jul",
  8: "Aug",
  9: "Sep",
  10: "Oct",
  11: "Nov",
  12: "Dec",
};

Map<int, String> intToWeekDay = {
  7: "Sunday",
  1: "Monday",
  2: "Tuesday",
  3: "Wednesday",
  4: "Thursday",
  5: "Friday",
  6: "Saturday",
  // 7: "Sunday",
};

Map<String, int> weekDayToIntConverter = {
  "Sunday": 7,
  "Monday": 1,
  "Tuesday": 2,
  "Wednesday": 3,
  "Thursday": 4,
  "Friday": 5,
  "Saturday": 6,
  // 7: "Sunday",
};
Map<int, Color> bookBackGroundColors = {
  0: const Color(0xffFD694C),
  1: const Color(0xff33556A),
  2: const Color(0xff3C3773),
  3: const Color(0xffFF9834),
};
