import 'package:devhabit/constants/dimensions.dart';
import 'package:devhabit/features/onBoarding/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RoadmapCreatorDialog {
  static void showRoadmapCreatorDialog(
      {required BuildContext context,
      required RiveAnimationController controller}) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Signin",
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
          Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(
          getScreenWidth(context) * 0.05,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * 0.005,
        ).copyWith(
          top: getScreenheight(context) * 0.25,
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
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: AnimatedButton(
                      btnAnimationController: controller,
                      press: () {
                        controller.isActive = true;
                      },
                      text: 'Generate',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
