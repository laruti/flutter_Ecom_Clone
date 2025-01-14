import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fu_ecom/pages/UserPage.dart';
import 'package:fu_ecom/pages/app_home.dart';
import 'package:fu_ecom/pages/app_search.dart';
import 'package:iconsax/iconsax.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final List pages = [
    AppHome(),
    AppSearch(),
    Scaffold(),
    Userpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black38,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey[350],
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) => (setState(() {
                selectedIndex = value;
              })),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.search_normal), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.notification), label: "Notification"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
      body: pages[selectedIndex],
    );
  }
}
