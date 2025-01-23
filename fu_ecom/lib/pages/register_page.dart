
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fu_ecom/components/box_text.dart';
import 'package:fu_ecom/components/login_botton.dart';
import 'package:fu_ecom/components/squreTitle.dart';
import 'package:fu_ecom/service/auth_services.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (passwordController.text.trim() == confirmPasswordController.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        // Close the loading dialog
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/shop_page');

      } else {
        showGeneralErrorMessage("password don't much");
      }
      // ignore: use_build_context_synchronously
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
                  height: 20,
                ),
                //logo
                const Icon(
                  Iconsax.shopping_cart,
                  size: 100,
                ),
                const SizedBox(
                  height: 40,
                ),
                //description
                Text("Let create acconunt for You!",
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
                BoxText(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
            
                //button sign
                const SizedBox(
                  height: 25,
                ),
                LoginButton(
                  text: "Sign Up",
                  onTap: signUserUp,
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
                        "Login Now",
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
