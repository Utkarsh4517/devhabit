import 'package:devhabit/constants/colors.dart';
import 'package:devhabit/constants/dimensions.dart';
import 'package:devhabit/features/home/widgets/primary_popular_card.dart';
import 'package:devhabit/features/home/widgets/roadmap_creator_dialog.dart';
import 'package:devhabit/features/onBoarding/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RiveAnimationController _btnAnimationController;
  late RiveAnimationController _generateRoadmapButtonController;
  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    _generateRoadmapButtonController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: bgColor,
        elevation: 0,
        leading: Container(
          margin:
              EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.015),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Icon(Icons.menu),
        ),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // popular text
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getScreenWidth(context) * 0.05),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: getScreenWidth(context) * 0.085,
                  ),
                ),
              ),

              // cards
              SizedBox(
                height: getScreenheight(context) * 0.4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    PrimaryPopularCard(
                      domainName: 'Django',
                      numOfDays: '60',
                      tagLine:
                          "Master Django web development in just 60 days - from zero to deploying dynamic websites and web apps with Python's powerful framework",
                    ),
                    PrimaryPopularCard(
                      domainName: 'Django',
                      numOfDays: '60',
                      tagLine:
                          "Master Django web development in just 60 days - from zero to deploying dynamic websites and web apps with Python's powerful framework",
                    ),
                    PrimaryPopularCard(
                      domainName: 'Django',
                      numOfDays: '60',
                      tagLine:
                          "Master Django web development in just 60 days - from zero to deploying dynamic websites and web apps with Python's powerful framework",
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getScreenWidth(context) * 0.05,
                    vertical: getScreenWidth(context) * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommended',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: getScreenWidth(context) * 0.055,
                      ),
                    ),
                    const Text(
                      'Based on your activity',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedButton(
        btnAnimationController: _btnAnimationController,
        press: () {
          _btnAnimationController.isActive = true;
          Future.delayed(const Duration(milliseconds: 600), () {
            RoadmapCreatorDialog.showRoadmapCreatorDialog(
              context: context,
              controller: _generateRoadmapButtonController,
            );
          });
        },
        text: 'Create a roadmap!',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // show general dialog
}
