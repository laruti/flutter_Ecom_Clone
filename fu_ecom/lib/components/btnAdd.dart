import 'package:flutter/material.dart';

class Btnadd extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color color;
  final Color colorfn; //for text color
  final IconData? iconData;
  const Btnadd(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color,
      required this.colorfn,
      required this.iconData,
      });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.only(bottom: 10),
          color: color,
          //  decoration: BoxDecoration(
          //   color: color, // Background color
          //   border: Border.all(color:Colors.black87,), // Border
          //  // Rounded corners
          // ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                  style: TextStyle(color: colorfn),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
