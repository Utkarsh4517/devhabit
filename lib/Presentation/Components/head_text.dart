
import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadText extends StatelessWidget {
  final double fontSizeFactor;
  final String text;
  final Color color;
  const HeadText({
    required this.color,
    required this.text,
    required this.fontSizeFactor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getScreenWidth(context) * 0.05,
      ),
      alignment: const AlignmentDirectional(-1, 0),
      child: Text(
        text,
        style: GoogleFonts.chivo(
          color: color,
          height: 0,
          fontWeight: FontWeight.bold,
          fontSize: getScreenWidth(context) * fontSizeFactor,
        ),
      ),
    );
  }
}
