import 'package:flutter/material.dart';


class MyType extends StatefulWidget {
  final String textType;
  final void Function()? onTap;
  const MyType({super.key,required this.onTap,required this.textType});

  @override
  State<MyType> createState() => _MyTypeState();
}

class _MyTypeState extends State<MyType> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onTap,
      child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.textType,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            // see all should use function psuh to page
            Text(
              "See All",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
