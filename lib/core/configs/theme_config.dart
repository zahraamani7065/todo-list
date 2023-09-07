import 'dart:ui';

import 'package:flutter/material.dart';

class ThemeConfig {
  final primaryColor = Color(0xFF4D7EFA);
  final Color primaryTextColor = Colors.white;
  final Color secondaryTextColor = Colors.grey;
  final Color surfaceColor = Colors.blueAccent;
  final Color backgroundColor = Colors.black;
  final Color appBarColor = Colors.black;
  final Brightness brightness = Brightness.dark;
  final Color secondry = Colors.grey;
  final Color onsecondray = Color(0xFF1D1D1D);

  // final Color onPrimary;
  ThemeData getTheme() {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
              color: secondaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.normal),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: secondry), // Border color when focused
          ),
        ),
        primaryColor: primaryColor,
        textTheme: TextTheme(
            bodyText1: TextStyle(
              color: primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            bodyText2: TextStyle(
              color: primaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            headline1: TextStyle(
              color: secondaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            headline2: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: secondaryTextColor),
            headline3: TextStyle(color: primaryTextColor, fontSize: 16),
            headline6: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: primaryTextColor),
            headline5: TextStyle(
                color: primaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 20)),
        backgroundColor: backgroundColor,
        colorScheme: ColorScheme(
          secondary: secondry,
          brightness: Brightness.dark,
          primary: primaryColor,
          onPrimary: Colors.grey.shade300,
          error: Colors.red,
          surface: Colors.black,
          onSecondary: onsecondray,
          onError: primaryColor,
          background: backgroundColor,
          onBackground: Colors.grey.shade800,
          onSurface: primaryColor,

        ));
  }
}
