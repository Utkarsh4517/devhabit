import 'package:devhabit/constants/colors.dart';
import 'package:devhabit/constants/dimensions.dart';
import 'package:devhabit/features/home/widgets/primary_popular_card.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RoadmapLoadingHomeUI extends StatefulWidget {
  final RiveAnimationController btnAnimationController;
  final RiveAnimationController generateRoadmapButtonController;
  final RiveAnimationController gnrBtnCntrl;

  const RoadmapLoadingHomeUI({
    required this.btnAnimationController,
    required this.generateRoadmapButtonController,
    required this.gnrBtnCntrl,
    super.key,
  });

  @override
  State<RoadmapLoadingHomeUI> createState() => _RoadmapLoadingHomeUIState();
}

class _RoadmapLoadingHomeUIState extends State<RoadmapLoadingHomeUI> {
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

              AnimatedContainer(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(context) * 0.05,
                  vertical: getScreenWidth(context) * 0.01,
                ),
                padding: EdgeInsets.symmetric(
                    vertical: getScreenWidth(context) * 0.05),
                alignment: Alignment.center,
                width: getScreenWidth(context),
                height: getScreenheight(context) * 0.15,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    SizedBox(
                      height: getScreenWidth(context) * 0.1,
                      width: getScreenWidth(context) * 0.1,
                      child: const CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: getScreenWidth(context) * 0.05),
                    const Text(
                      'Please wait',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    )
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
    );
  }
}
