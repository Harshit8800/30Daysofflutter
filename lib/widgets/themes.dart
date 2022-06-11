import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColor: darkBluishColor,
        cardColor: Colors.white,
        canvasColor: creamColor,
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
            color: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        primaryColor: Colors.white,
      );

  //Color
  static const creamColor = Color(0xfff5f5f5);
  static const darkCreamColor = Vx.gray900;
  static const darkBluishColor = Color(0xff043b58);
  static const lightBluishColor = Vx.purple400;
}
