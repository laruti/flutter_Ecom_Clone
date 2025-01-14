
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fu_ecom/components/box_text.dart';
import 'package:fu_ecom/components/login_botton.dart';
import 'package:fu_ecom/components/squreTitle.dart';
import 'package:fu_ecom/service/auth_services.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
   const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIN() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      // Close the loading dialog
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      // Close the loading dialog before showing an error
      Navigator.pop(context);
      // if (e.code == 'user-not-found') {
      //   wrongEmailMessage();
      // } else if (e.code == 'wrong-password') {
      //   wrongPasswordMessage();
      // }else {
      showGeneralErrorMessage(e.message ?? "An error occurred");
    }
  }

//  void wrongEmailMessage() {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return const AlertDialog(
//         title: Text("Invalid Email"),
//         content: Text("The email you entered is not registered."),
//       );
//     },
//   );
// }

// void wrongPasswordMessage() {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return const AlertDialog(
//         title: Text("Invalid Password"),
//         content: Text("The password you entered is incorrect."),
//       );
//     },
//   );
// }
  void showGeneralErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                //description
                Text("well comeback you'have been missed",
                    style: TextStyle(
                      color: Colors.grey[700],
                    )),
                const SizedBox(
                  height: 50,
                ),
                BoxText(
                  hintText: "Email",
                  controller: emailController,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                BoxText(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                //forget password
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "forget password!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                //button sign
                const SizedBox(
                  height: 25,
                ),
                LoginButton(
                  text:"Sign IN",
                  onTap: signUserIN,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                    ],
                  ),
                ),
                //logo
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SqureTitle(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/image/new.webp'),
                    const SizedBox(
                      width: 25,
                    ),
                     SqureTitle(
                      onTap: (){},
                     imagePath: 'lib/image/google.png'),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a remember ?"),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register now",
                        style: TextStyle(
                            color: Colors.blue[300],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
