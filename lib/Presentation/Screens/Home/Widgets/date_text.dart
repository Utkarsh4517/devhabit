import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateText extends StatelessWidget {
  final String text;
  const DateText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.leagueSpartan(
          color: blackColor,
          fontWeight: FontWeight.bold,
          fontSize: getScreenWidth(context) * 0.07,
        ));
  }
}
