// ignore_for_file: use_build_context_synchronously

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:devhabit/constants/dimensions.dart';
import 'package:devhabit/features/home/repo/gemini_services.dart';
import 'package:devhabit/features/home/repo/home_firebase_services.dart';
import 'package:devhabit/features/onBoarding/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RoadmapCreatorDialog {
  static void showRoadmapCreatorDialog(
      {required BuildContext context,
      required RiveAnimationController controller,
      required RiveAnimationController genrBtnCntrl}) {
    int _currentIndex = 1;
    String _experience = 'Beginner';
    final _domainController = TextEditingController();
    final _daysController = TextEditingController();
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "roadmapCreator",
      context: context,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeIn),
          ),
          child: child,
        );
      },
      pageBuilder: (
        context,
        _,
        __,
      ) =>
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          alignment: Alignment.center,
          padding: EdgeInsets.all(
            getScreenWidth(context) * 0.05,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.005,
          ).copyWith(
            top: _currentIndex == 1
                ? getScreenheight(context) * 0.5
                : _currentIndex == 2
                    ? getScreenWidth(context) * 1.3
                    : getScreenWidth(context) * 0.25,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                25,
              ),
            ).copyWith(
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Create Roadmap',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 28,
                        ),
                      ),
                    ),
                    if (_currentIndex == 1)
                      Container(
                        padding: EdgeInsets.all(
                          getScreenWidth(context) * 0.05,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'With devhabit you can get a well designed and perfect roadmap to learn any new tech stack.\n\nGet started by selecting a domain of choice with a reasonable number of days to complete it, and we will take care of your consistency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    if (_currentIndex == 1)
                      Container(
                        alignment: Alignment.centerRight,
                        child: AnimatedButton(
                          btnAnimationController: controller,
                          press: () {
                            controller.isActive = true;
                            setState(() {
                              _currentIndex += 1;
                            });
                          },
                          text: 'Proceed',
                        ),
                      ),
                    if (_currentIndex == 2)
                      Container(
                        padding: EdgeInsets.all(
                          getScreenWidth(context) * 0.05,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'What is your prior programming experience?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    if (_currentIndex == 2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ChoiceChip(
                            label: const Text('Beginner'),
                            selected: (_experience == 'Beginner'),
                            onSelected: (selected) {
                              setState(() {
                                _experience = 'Beginner';
                              });
                            },
                          ),
                          ChoiceChip(
                            label: const Text('Intermediate'),
                            selected: (_experience == 'Intermediate'),
                            onSelected: (selected) {
                              setState(() {
                                _experience = 'Intermediate';
                              });
                            },
                          ),
                          ChoiceChip(
                            label: const Text('Advanced'),
                            selected: (_experience == 'Advanced'),
                            onSelected: (selected) {
                              setState(() {
                                _experience = 'Advanced';
                              });
                            },
                          ),
                        ],
                      ),
                    if (_currentIndex == 2) const Spacer(),
                    if (_currentIndex == 2)
                      Container(
                        alignment: Alignment.centerRight,
                        child: AnimatedButton(
                          btnAnimationController: controller,
                          press: () {
                            controller.isActive = true;
                            setState(() {
                              _currentIndex += 1;
                            });
                          },
                          text: 'Next',
                        ),
                      ),
                    if (_currentIndex == 3)
                      Container(
                        padding: EdgeInsets.all(
                          getScreenWidth(context) * 0.05,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Begin with selecting a domain!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    if (_currentIndex == 3)
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _domainController,
                              decoration: InputDecoration(
                                labelText: 'Enter your domain',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getScreenWidth(context) * 0.1),
                            TextFormField(
                              controller: _daysController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Enter number of days!',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (_currentIndex == 3) const Spacer(),
                    if (_currentIndex == 3)
                      Container(
                        alignment: Alignment.center,
                        child: AnimatedButton(
                          btnAnimationController: genrBtnCntrl,
                          press: () async {
                            genrBtnCntrl.isActive = true;
                            dynamic output = await HomeRepo.generateRoadmap(
                              domain: _domainController.text,
                              days: _daysController.text,
                              experience: _experience,
                            );

                            final roadmaps =
                                HomeRepo.extractInformation(output);
                            await HomeFirebaseServices.addRoadmapsToFirebase(
                              roadmaps,
                            );
                            AnimatedSnackBar.material(
                              '${_daysController.text} days roadmap created for ${_domainController.text}',
                              type: AnimatedSnackBarType.success,
                            ).show(context);
                            Navigator.pop(context);
                          },
                          text: 'Generate',
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
