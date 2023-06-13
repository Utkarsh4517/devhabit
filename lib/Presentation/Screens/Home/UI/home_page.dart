import 'package:devhabit/Presentation/Components/black_head_text.dart';
import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:devhabit/Presentation/Components/grey_head_text.dart';
import 'package:devhabit/Presentation/Screens/Home/Widgets/top_icon.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = getScreenWidth(context);
    double screenHeight = getScreenheight(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getScreenheight(context) * 0.02,
              ),

              // good morning and calendar + notification  container
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlackHeadtext(text: 'Good', fontSizeFactor: 0.08),
                      GreyHeadText(text: 'morning', fontSizeFactor: 0.08)
                    ],
                  ),

                  // calender + notification.
                  Container(
                    margin: EdgeInsets.only(right: getScreenWidth(context)* 0.02),
                    child: const Row(
                      children: [
                        HomePageTopIcon(icon: Icons.calendar_today_rounded),
                        HomePageTopIcon(icon: Icons.notifications_active)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
