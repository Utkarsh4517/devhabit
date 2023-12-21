import 'dart:ui';

import 'package:devhabit/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
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
              filter: ImageFilter.blur(sigmaX: 80, sigmaY: 60),
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
                        'devhabit.',
                        style: TextStyle(
                            fontSize: 50, fontFamily: "Poppins", height: 1.2),
                      ),
                      SizedBox(height: getScreenWidth(context) * 0.04),
                      const Text(
                        "Craft Your Code Destiny: Tailored Roadmaps, Your Way, Every Day - Unleash the Power of AI Development Guidance!",
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
      )
    );
  }
}
