import 'package:devhabit/features/onBoarding/ui/intro_page2.dart';
import 'package:devhabit/features/onBoarding/ui/intro_page3.dart';
import 'package:devhabit/features/onBoarding/ui/intro_page1.dart';
import 'package:devhabit/features/onBoarding/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  late RiveAnimationController _btnAnimationController;
  bool onLastPage = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
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
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!onLastPage)
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: AnimatedButton(
                        btnAnimationController: _btnAnimationController,
                        press: () {
                          _btnAnimationController.isActive = true;
                          // await Future.delayed(const Duration(milliseconds: 100));
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInToLinear,
                          );
                        },
                        text: 'Next'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
