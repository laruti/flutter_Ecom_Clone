import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fu_ecom/models/bannerStyle.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
     final PageController _pageController =
        PageController(); // PageController for controlling the PageView
    int _currentPage = 0;

    // Start a timer to auto-slide
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < imageList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Loop back to the first page
      }

      // Animate to the next page
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
     return Container(
      height: 200,
      child: PageView.builder(
        controller: _pageController, // Attach the PageController
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Image.network(
            imageList[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
    // return Container(
    //   height: size.height * 0.23,
    //   width: size.width,
    //   color: const Color.fromARGB(255, 249, 220, 220),
    //   child: Padding(
    //     padding: const EdgeInsets.only(
    //       left: 27,
    //     ),
    //     child: Stack(
    //       children: [
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             const Text(
    //               "NEW COLLECTION",
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                   letterSpacing: -2),
    //             ),
    //             const Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   "20",
    //                   style: TextStyle(
    //                       fontSize: 40,
    //                       height: 0,
    //                       fontWeight: FontWeight.bold,
    //                       letterSpacing: -2),
    //                 ),
    //                 Column(
    //                   children: [
    //                     Text(
    //                       "%",
    //                       style: TextStyle(fontWeight: FontWeight.w900),
    //                     ),
    //                     Text("OFF",
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.w900, fontSize: 10))
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             MaterialButton(
    //               onPressed: () {},
    //               color: Colors.black,
    //               child: const Text(
    //                 "SHOP NOW",
    //                 style: TextStyle(color: Colors.white, fontSize: 12),
    //               ),
    //             )
    //           ],
    //         ),
    //         Align(
    //           alignment: Alignment.bottomRight,
    //           child: Image.asset(
    //             'lib/image/modelbn.jpg',
    //             fit: BoxFit.cover,
    //             height: size.height * 0.25,
    //             width: size.width*0.5,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
