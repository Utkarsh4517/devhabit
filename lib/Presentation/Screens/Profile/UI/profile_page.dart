import 'package:devhabit/Presentation/Components/export_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _avatarUrl = '';
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    List<UserInfo> providerData = user!.providerData;
    // Find the provider data with Google Sign-In
    UserInfo googleUserInfo = providerData.firstWhere(
      (info) => info.providerId == 'google.com',
      orElse: () => null!,
    );
    if (googleUserInfo != null) {
      // Retrieve the user's avatar URL from Google Sign-In provider data
      String avatarUrl = googleUserInfo.photoURL!;
      setState(() {
        _avatarUrl = avatarUrl;
      });

    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getScreenheight(context) * 0.05),
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(_avatarUrl),
                  radius: getScreenWidth(context) * 0.2,
                  backgroundColor: lightBlue,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: getScreenWidth(context) * 0.05,
                ),
                child: Text(
                  user.displayName!,
                  style: GoogleFonts.leagueSpartan(
                      color: blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: getScreenWidth(context) * 0.05),
                ),
              ),
              SizedBox(height: getScreenheight(context) * 0.5),
              GestureDetector(
                onTap: signOut,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: getScreenWidth(context) * 0.04),
                  child: const Row(
                    children: [
                      Icon(FeatherIcons.logOut),
                      Text(' Logout')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void signOut()  {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }
}
