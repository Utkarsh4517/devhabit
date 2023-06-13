import 'package:devhabit/Presentation/Components/head_text.dart';
import 'package:devhabit/Presentation/Components/export_components.dart';
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
                     HeadText(color: blackColor, text: 'Good', fontSizeFactor: 0.08),
                     HeadText(color: greyColor, text: 'morning', fontSizeFactor: 0.08),
                    ],
                  ),

                  // calender + notification.
                  Container(
                    margin:
                        EdgeInsets.only(right: getScreenWidth(context) * 0.02),
                    child: const Row(
                      children: [
                        HomePageTopIcon(icon: Icons.calendar_today_rounded),
                        HomePageTopIcon(icon: Icons.notifications_active)
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: blackColor,
                ),
                margin: EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.05),
                child: const Column(
                  children: [
                    HeadText(color: whiteColor, text: '13 June, Tue', fontSizeFactor: 0.02)
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
