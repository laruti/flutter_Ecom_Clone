
import 'package:flutter/material.dart';
import 'package:fu_ecom/pages/loginPage.dart';
import 'package:fu_ecom/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void toglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap:toglePage ,
      );
    } else {
      return RegisterPage(
        onTap: toglePage,
      );
    }
  }
}
