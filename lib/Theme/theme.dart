import 'package:book_basket/Constants/enums.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

const MaterialColor primaryMaterialColor = MaterialColor(
  4282533365,
  <int, Color>{
    50: Color.fromRGBO(
      35,
      166,
      177,
      .1,
    ),
    100: Color.fromRGBO(
      35,
      166,
      177,
      .2,
    ),
    200: Color.fromRGBO(
      35,
      166,
      177,
      .3,
    ),
    300: Color.fromRGBO(
      35,
      166,
      177,
      .4,
    ),
    400: Color.fromRGBO(
      35,
      166,
      177,
      .5,
    ),
    500: Color.fromRGBO(
      35,
      166,
      177,
      .6,
    ),
    600: Color.fromRGBO(
      35,
      166,
      177,
      .7,
    ),
    700: Color.fromRGBO(
      35,
      166,
      177,
      .8,
    ),
    800: Color.fromRGBO(
      35,
      166,
      177,
      .9,
    ),
    900: Color.fromRGBO(
      35,
      166,
      177,
      1,
    ),
  },
);

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.lightTheme: ThemeData( 
    brightness: Brightness.light,
    fontFamily: 'inter',
    primaryColor: const Color(0xff23A6B1),
    primarySwatch: primaryMaterialColor,
    // textTheme: GoogleFonts.interTextTheme(),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(fontWeight: FontWeight.w500),
      elevation: 0,
    ),
    tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: const Color(0xff23A6B1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        unselectedLabelStyle: const TextStyle(color: Colors.white54)),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff23A6B1)),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff23A6B1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: Color(0xff23A6B1),
      unselectedItemColor: Colors.black87,
    ),
  ),
  AppTheme.darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff23A6B1),
    primarySwatch: primaryMaterialColor,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white12),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff23A6B1)),
          borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff23A6B1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: Color(0xff23A6B1),
      unselectedItemColor: Colors.white70,
    ),
  ),
};
