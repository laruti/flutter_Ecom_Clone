import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fu_ecom/components/profile_st.dart';
import 'package:fu_ecom/pages/aboutUs.dart';
import 'package:fu_ecom/pages/settingPage/settingPage.dart';
import 'package:iconsax/iconsax.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  final user = FirebaseAuth.instance.currentUser!;
  void signOutUser(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/auth_page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("My Account"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              CircleAvatar(
                backgroundColor:
                    Colors.grey[300], // Background color of the avatar
                radius: 50, // Adjust the size of the avatar
                child: ClipOval(
                  // Ensures the image fits properly within the circular shape
                  child: Image.asset(
                    "lib/image/womenAv2.jpg",
                    fit: BoxFit.cover, // Ensures the image covers the area
                    width: 100, // Match this to 2 * radius for proper sizing
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Ms thida",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(user.email!),
              const SizedBox(
                height: 15,
              ),
              ProfileSt(
                textLable: "wallet",
                icon: Iconsax.wallet,
                onTap: () {},
              ),
              ProfileSt(
                textLable: "My order",
                icon: Icons.library_books_outlined,
                onTap: () {},
              ),
              ProfileSt(
                textLable: "My account",
                icon: Icons.person,
                onTap: () {},
              ),
              ProfileSt(
                textLable: "Customer spport",
                icon: Icons.chat_rounded,
                onTap: () {},
              ),
              ProfileSt(
                textLable: "About Us",
                icon: Icons.ads_click_sharp,
                onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>const Aboutus()));},
              ),
              ProfileSt(
                textLable: "Setting",
                icon: Icons.settings,
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const Settingpage()));
                },
              ),
              ProfileSt(
                  textLable: "Logout",
                  icon: Icons.logout,
                  onTap: () => signOutUser(context)),
            ],
          ),
        ),
      ),
    );
  }
}
