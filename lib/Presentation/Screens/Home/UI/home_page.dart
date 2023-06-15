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
      ),

      // add task
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        backgroundColor: whiteColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              width: getScreenWidth(context) * 0.9,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(getScreenWidth(context) * 0.04),
                    child: Text(
                      'create a new task',
                      style: GoogleFonts.leagueSpartan(
                          color: blackColor, fontWeight: FontWeight.bold, fontSize: getScreenheight(context) * 0.03),
                    ),
                  ),

                  // text form field which contains the task
                  Container(
                    margin: EdgeInsets.all(getScreenWidth(context) * 0.08),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(FeatherIcons.bookmark),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: blackColor,width: 2,),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        hintText: 'Task'
                      ),
                    ),
                  )
                ],
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        },
        child: const Icon(
          FeatherIcons.plus,
          color: blackColor,
        ),
      ),
    );
  }
}
