import 'dart:ui';

import 'package:flutter/material.dart';

class AppThemeProvider {
  static const teal = Color(0xff11998e);
  static const darkTeal = Color(0xff30383b);
  static const lime = Color(0xff38ef7d);
  static const facebookBlue = Color(0xff4267b2);
  static const googleRed = Color(0xffdb4437);
  static const grey = Color(0xffb0b0b0);


  static final current = ThemeData(
    accentColor: teal,
    fontFamily: 'Avenir-roman',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(),
      contentPadding: EdgeInsets.only(bottom: 5),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppThemeProvider.grey)
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppThemeProvider.grey)
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppThemeProvider.grey)
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppThemeProvider.grey)
      )
    )
  );
}