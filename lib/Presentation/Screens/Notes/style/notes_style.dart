import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgcolor = Color(0xffe2e2ff);
  static Color mainColor = Color(0xff000633);
  static Color accentColor = Color(0xff0065ff);


  // setting the cards different color

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red[100]!,
    Colors.pink[100]!,
    Colors.orange[100]!,
    Colors.yellow[100]!,
    Colors.green[100]!,
    Colors.blue[100]!,
    Colors.blueGrey[100]!,
  ];

  static TextStyle mainTitle = GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle mainContent = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle dateTitle = GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500);
}