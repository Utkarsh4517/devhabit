import 'package:devhabit/constants/colors.dart';
import 'package:devhabit/constants/dimensions.dart';
import 'package:devhabit/features/home/bloc/home_bloc.dart';
import 'package:devhabit/features/home/widgets/primary_popular_card.dart';
import 'package:devhabit/features/home/widgets/roadmap_creator_dialog.dart';
import 'package:devhabit/features/onBoarding/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class RoadmapDoesNotExistHomeUI extends StatefulWidget {
  final RiveAnimationController btnAnimationController;
  final RiveAnimationController generateRoadmapButtonController;
  final RiveAnimationController gnrBtnCntrl;
  final HomeBloc homeBloc;
  const RoadmapDoesNotExistHomeUI({
    required this.btnAnimationController,
    required this.generateRoadmapButtonController,
    required this.gnrBtnCntrl,
    required this.homeBloc,
    super.key,
  });

  @override
  State<RoadmapDoesNotExistHomeUI> createState() =>
      _RoadmapDoesNotExistHomeUIState();
}

class _RoadmapDoesNotExistHomeUIState extends State<RoadmapDoesNotExistHomeUI> {
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
                height: getScreenheight(context) * 0.22,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/img/warning.svg',
                      width: getScreenWidth(context) * 0.2,
                      height: getScreenWidth(context) * 0.2,
                    ),
                    SizedBox(height: getScreenWidth(context) * 0.05),
                    const Text(
                      'Try creating a roadmap',
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
      floatingActionButton: AnimatedButton(
        btnAnimationController: widget.btnAnimationController,
        press: () {
          widget.btnAnimationController.isActive = true;
          Future.delayed(const Duration(milliseconds: 600), () {
            RoadmapCreatorDialog.showRoadmapCreatorDialog(
              context: context,
              controller: widget.generateRoadmapButtonController,
              genrBtnCntrl: widget.gnrBtnCntrl,
              homeBloc: widget.homeBloc,
            );
          });
        },
        text: 'Create a roadmap!',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
