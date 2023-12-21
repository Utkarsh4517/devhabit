import 'dart:ui';

import 'package:devhabit/constants/dimensions.dart';
import 'package:devhabit/features/auth/service/auth_service.dart';
import 'package:devhabit/features/onBoarding/services/on_boarding_handler.dart';
import 'package:devhabit/features/onBoarding/widgets/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  late RiveAnimationController _btnAnimationController;
  late RiveAnimationController _authBtnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    _authBtnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: getScreenWidth(context) * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getScreenWidth(context) * 0.05,
                  ),
                  width: getScreenWidth(context) * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Learn code & build',
                        style: TextStyle(
                            fontSize: 60, fontFamily: "Poppins", height: 1.2),
                      ),
                      SizedBox(height: getScreenWidth(context) * 0.04),
                      const Text(
                        "Navigate Your Code Journey with Precision: Your Tech, Your Days, Your Roadmap - AI-Powered Development Companion.",
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(context) * 0.05),
                  child: AnimatedButton(
                    btnAnimationController: _btnAnimationController,
                    text: 'Begin your journey!',
                    press: () {
                      _btnAnimationController.isActive = true;

                      Future.delayed(const Duration(milliseconds: 800), () {
// show auth dialog
                        showGeneralDialog(
                          barrierDismissible: true,
                          barrierLabel: "Signin",
                          context: context,
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            Tween<Offset> tween;
                            tween =
                                Tween(begin: const Offset(0, 1), end: Offset.zero);
                            return SlideTransition(
                              position: tween.animate(
                                CurvedAnimation(
                                    parent: animation, curve: Curves.easeInOut),
                              ),
                              child: child,
                            );
                          },
                          pageBuilder: (
                            context,
                            _,
                            __,
                          ) =>
                              Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(
                              getScreenWidth(context) * 0.05,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: getScreenWidth(context) * 0.05,
                              vertical: getScreenheight(context) * 0.25,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  25,
                                ),
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
                                          'Sign in',
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 34,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: EdgeInsets.all(
                                          getScreenWidth(context) * 0.05,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Kickstart your journey today with devhabit, your one stop solution to learn code',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      AnimatedButton(
                                        btnAnimationController:
                                            _authBtnAnimationController,
                                        press: () {
                                          _authBtnAnimationController.isActive =
                                              true;
                                          OnboardingHandler.completeOnboarding(
                                              context);
                                          AuthService()
                                              .continueWithGoogle(context);
                                        },
                                        text: 'Continue with google!',
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(context) * 0.05,
                      vertical: getScreenWidth(context) * 0.1),
                  width: getScreenWidth(context) * 0.8,
                  child: const Text(
                    "Craft your code destiny effortlessly, as DevHabit empowers you to navigate the intricacies of development with precision and ease. Your habits, your goals, your success - all fueled by the brilliance of Gemini AI.",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
