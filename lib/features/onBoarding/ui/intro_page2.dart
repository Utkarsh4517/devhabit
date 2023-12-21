import 'dart:ui';

import 'package:devhabit/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

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
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 20),
          ),
        ),
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 65, sigmaY: 65),
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
                      'IDE\nSupport.',
                      style: TextStyle(
                          fontSize: 50, fontFamily: "Poppins", height: 1.2),
                    ),
                    SizedBox(height: getScreenWidth(context) * 0.04),
                    const Text(
                      "Write and Test with Confidence using our In-House IDE. Seamlessly integrated, your coding journey begins and triumphs within the comfort of DevHabit's AI-powered IDE environment.",
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
