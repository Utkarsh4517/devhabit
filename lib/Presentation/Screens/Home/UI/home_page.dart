import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:devhabit/Presentation/Screens/Home/Widgets/date_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String date = "${today.day}";

    DateFormat formatter = DateFormat.MMMM('en');
    String month = formatter.format(today);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: getScreenheight(context) * 0.1,
          backgroundColor: whiteColor,
          elevation: 0,
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'devhabit.',
                style: GoogleFonts.leagueSpartan(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: getScreenWidth(context) * 0.08),
              )),
          actions: [
            Container(
              margin: EdgeInsets.only(right: getScreenWidth(context) * 0.03),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.user,
                  color: blackColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: getScreenWidth(context) * 0.5,
                margin: EdgeInsets.only(left: getScreenWidth(context) * 0.035),
                child: Row(
                  children: [
                    DateText(text: '$date - '),
                    DateText(text: month),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
