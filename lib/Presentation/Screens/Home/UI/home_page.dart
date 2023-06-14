import 'package:devhabit/Presentation/Components/head_text.dart';
import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:devhabit/Presentation/Screens/Home/Widgets/top_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                      HeadText(
                          color: blackColor,
                          text: 'Good',
                          fontSizeFactor: 0.08),
                      HeadText(
                          color: greyColor,
                          text: 'morning',
                          fontSizeFactor: 0.08),
                    ],
                  ),

                  // calender + notification.
                  Container(
                    margin:
                        EdgeInsets.only(right: getScreenWidth(context) * 0.02),
                    child: Row(
                      children: [
                        const HomePageTopIcon(
                            icon: Icons.calendar_today_rounded),
                        const HomePageTopIcon(icon: Icons.notifications_active),
                        GestureDetector(
                          onTap: () => FirebaseAuth.instance.signOut(),
                          child: const HomePageTopIcon(
                            icon: Icons.logout,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              // progress container
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: blackColor,
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: getScreenWidth(context) * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    const HeadText(
                        color: greyColor,
                        text: '13 June, Tue',
                        fontSizeFactor: 0.03),
                    const HeadText(
                        color: whiteColor,
                        text: "Today's progress",
                        fontSizeFactor: 0.06),
                    SizedBox(height: screenHeight * 0.1),
                    const HeadText(
                        color: greyColor,
                        text: "10/12 tasks",
                        fontSizeFactor: 0.03),
                    const HeadText(
                        color: whiteColor, text: '83%', fontSizeFactor: 0.25),
                    SizedBox(height: screenHeight * 0.07),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // ongoing tasks
              const HeadText(
                  color: blackColor, text: 'Ongoing', fontSizeFactor: 0.09)
              // ongoing tasks listview

              // temp sizedbox
            ],
          ),
        ),
      ),
    );
  }
}
