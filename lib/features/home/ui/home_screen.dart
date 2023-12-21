import 'package:devhabit/features/onBoarding/ui/intro_page3.dart';
import 'package:devhabit/features/onBoarding/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RiveAnimationController _signOutBtnAnimation;

  @override
  void initState() {
    _signOutBtnAnimation = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AnimatedButton(
            btnAnimationController: _signOutBtnAnimation,
            press: () async {
              _signOutBtnAnimation.isActive = true;
              await GoogleSignIn().signOut();
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const IntroPage3()));
            },
            text: 'Sign out')
      ],
    ));
  }
}
