import 'dart:ffi';

import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String time;
  final String ampm;
  final bool check;
  final Color iconBgColor;
  final Color iconColor;
  const ToDoCard({
    required this.title,
    required this.time,
    required this.ampm,
    required this.check,
    required this.iconData,
    required this.iconBgColor,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: getScreenWidth(context) * 0.02,
        bottom: getScreenWidth(context) * 0.03,
      ),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              activeColor: blue,
              checkColor: blackColor,
              value: check,
              onChanged: (bool? value) {},
            ),
          ),
          Expanded(
            child: Container(
              height: getScreenWidth(context) * 0.15,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: lightBlue,
                child: Row(
                  children: [
                    SizedBox(
                      width: getScreenWidth(context) * 0.015,
                    ),
                    Container(
                      height: getScreenWidth(context) * 0.08,
                      width: getScreenWidth(context) * 0.08,
                      decoration: BoxDecoration(
                          color: iconBgColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        iconData,
                        color: iconColor,
                      ),
                    ),
                    SizedBox(
                      width: getScreenWidth(context) * 0.015,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.chivo(color: Colors.black),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(getScreenWidth(context) * 0.02),
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            Text(
                              time,
                              style: GoogleFonts.chivo(color: blackColor),
                            ),
                            Text(
                              ampm,
                              style: GoogleFonts.chivo(
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
