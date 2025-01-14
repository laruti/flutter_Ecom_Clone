import 'package:flutter/material.dart';

class SqureTitle extends StatelessWidget {
  final imagePath;
  final Function()? onTap;

  const SqureTitle({super.key, required this.imagePath,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200]),
        child: Image.asset(
          imagePath,
          height: 60,
        ),
      ),
    );
  }
}
