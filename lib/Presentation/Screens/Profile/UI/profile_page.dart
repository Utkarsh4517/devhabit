import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getScreenheight(context) * 0.05),
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: getScreenWidth(context) * 0.2,
                  backgroundColor: lightBlue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
