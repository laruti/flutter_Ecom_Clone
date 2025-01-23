import 'package:flutter/material.dart';

class ProfileSt extends StatelessWidget {
  final String textLable;
  final IconData icon;
  final void Function()? onTap;
  

  const ProfileSt({super.key, required this.textLable,required this.icon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          ),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon as IconData?,color: Colors.grey,),
                const SizedBox(
                  width: 7,
                ),
                Text(textLable,style:const TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
