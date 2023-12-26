import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhabit/constants/colors.dart';
import 'package:devhabit/constants/dimensions.dart';
import 'package:devhabit/features/home/bloc/home_bloc.dart';
import 'package:devhabit/features/home/repo/home_firebase_services.dart';
import 'package:devhabit/features/home/widgets/primary_popular_card.dart';
import 'package:devhabit/features/home/widgets/roadmap_creator_dialog.dart';
import 'package:devhabit/features/home/widgets/roadmap_list_tile.dart';
import 'package:devhabit/features/onBoarding/widgets/animated_button.dart';
import 'package:devhabit/models/roadmap_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

class RoadmapExistHomeUI extends StatefulWidget {
  final RiveAnimationController btnAnimationController;
  final RiveAnimationController generateRoadmapButtonController;
  final RiveAnimationController gnrBtnCntrl;
  final HomeBloc homeBloc;
  const RoadmapExistHomeUI({
    required this.btnAnimationController,
    required this.generateRoadmapButtonController,
    required this.gnrBtnCntrl,
    required this.homeBloc,
    super.key,
  });

  @override
  State<RoadmapExistHomeUI> createState() => _RoadmapExistHomeUIState();
}

class _RoadmapExistHomeUIState extends State<RoadmapExistHomeUI> {
  void getRoadmapLength() async {
    final roadmapLng = await HomeFirebaseServices.getRoadmapLength();
    setState(() {
      roadmapLength = roadmapLng;
    });
  }

  ScrollController _scrollController = ScrollController();
  bool _isFabVisible = true;

  @override
  void initState() {
    getRoadmapLength();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // User is scrolling up, show FAB
        if (!_isFabVisible) {
          setState(() {
            _isFabVisible = true;
          });
        }
      } else {
        // User is scrolling down, hide FAB
        if (_isFabVisible) {
          setState(() {
            _isFabVisible = false;
          });
        }
      }
    });
    super.initState();
  }

  int currentIndex = 0;
  int roadmapLength = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: widget.homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is DayTileClickedState) {
          setState(() {
            currentIndex = state.index;
          });
        } else if (state is OpenUserResponseDialogBoxState) {
          showGeneralDialog(
            context: context,
            pageBuilder: (context, _, __) => StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.all(
                    getScreenWidth(context) * 0.05,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: getScreenWidth(context) * 0.1,
                    vertical: getScreenheight(context) * 0.2,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: const Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Stack(
                      children: [
                        Column(
                          children: [],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: bgColor,
            elevation: 0,
            leading: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(context) * 0.015),
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
              controller: _scrollController,
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

                  // day tile
                  Container(
                    margin: EdgeInsets.only(
                        left: getScreenWidth(context) * 0.05,
                        bottom: getScreenWidth(context) * 0.05),
                    height: getScreenheight(context) * 0.08,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: roadmapLength,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            widget.homeBloc
                                .add(DayTileClickedEvent(index: index));
                          },
                          child: AnimatedContainer(
                            padding: EdgeInsets.symmetric(
                              horizontal: getScreenWidth(context) * 0.06,
                            ),
                            margin: EdgeInsets.only(
                                right: getScreenWidth(context) * 0.03),
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              color: index == currentIndex
                                  ? purpleColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    color: index == currentIndex
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: getScreenWidth(context) * 0.05,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  ('Day'),
                                  style: TextStyle(
                                    color: index == currentIndex
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: getScreenWidth(context) * 0.04,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // roadmap tile
                  SizedBox(
                    height: getScreenheight(context) * 0.33,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: HomeFirebaseServices.roadmapsStream,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final roadmapDocs = snapshot.data!.docs;
                              List<RoadmapModel> roadmaps =
                                  roadmapDocs.map((doc) {
                                final data = doc.data() as Map<String, dynamic>;
                                return RoadmapModel.fromMap(data);
                              }).toList();
                              final roadmap = roadmaps[currentIndex];
                              return RoadmapListTile(
                                roadmap: roadmap,
                                homeBloc: widget.homeBloc,
                              );
                            },
                          ),
                        ],
                      ),
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
          floatingActionButton: _isFabVisible
              ? AnimatedButton(
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
                  text: 'Folow a new roadmap?',
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
