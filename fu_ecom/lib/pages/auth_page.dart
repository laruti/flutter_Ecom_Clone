


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fu_ecom/pages/app_home.dart';
import 'package:fu_ecom/pages/login_register.dart';
import 'package:fu_ecom/pages/main_page.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainPage();
            } else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
