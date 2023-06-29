import 'package:devhabit/Data/auth_service.dart';
import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: GestureDetector(
          onTap: () => AuthService().signInWithGoogle(),
          child: Container(
            width: getScreenWidth(context) * 0.5,
            height: getScreenheight(context) * 0.07,
            decoration: BoxDecoration(
                border: Border.all(
                  color: greyColor,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                Text(
                  'Continue with Google!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
