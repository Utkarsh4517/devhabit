import 'package:devhabit/Presentation/Screens/Home/UI/home_page.dart';
import 'package:devhabit/Presentation/Screens/auth/UI/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),

        // This is constantly going to check if the user is signed in or not
        builder: (context, snapshot) {
          // if the user is logged in
          if (snapshot.hasData) {
            return const HomePage(); // nav page in future
          } else {
            return const LogInPage();
          }
        },
      ),
    );
  }
}
