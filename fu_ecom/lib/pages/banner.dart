import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.23,
      width: size.width,
      color: const Color.fromARGB(255, 249, 220, 220),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 27,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "NEW COLLECTION",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -2),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "20",
                      style: TextStyle(
                          fontSize: 40,
                          height: 0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -2),
                    ),
                    Column(
                      children: [
                        Text(
                          "%",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Text("OFF",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 10))
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.black,
                  child: Text(
                    "SHOP NOW",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'lib/image/modelbn.jpg',
                fit: BoxFit.cover,
                height: size.height * 0.25,
                width: size.width*0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
