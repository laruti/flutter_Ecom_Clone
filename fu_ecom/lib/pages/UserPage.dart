import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
   final user= FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.person),
            SizedBox(height:15,),
            Text("log success: "+user.email!)

          ],
        ),
      ),
      
    );
  }
}