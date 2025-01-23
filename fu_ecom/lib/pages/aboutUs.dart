import 'package:flutter/material.dart';
import 'package:fu_ecom/components/profile_st.dart';
import 'package:iconsax/iconsax.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("About Us "),
       
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.network(
                "https://zandokh.com/image/catalog/logo/TEN11.png",
                fit: BoxFit.cover, // Ensures the image covers the area
                // Match this to 2 * radius for proper sizing
                height: 70,
                
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 16,vertical: 10),
                     // Add padding for better spacing
                child: const Text(
                  "\n\n"
                  "We are  Ten11, a leading global e-commerce platform designed to make online shopping effortless and enjoyable! "
                  "At redBus, you can explore a wide range of products, compare prices, read reviews, and securely pay for your orders—all from the comfort of your home or on the go.\n\n"
                  "With millions of happy customers and partnerships with thousands of trusted sellers, redBus ensures reliability, affordability, and convenience. "
                  "From electronics and fashion to home essentials, we bring everything you need to your fingertips.\n\n"
                  "Shop with us for a fast, hassle-free, and satisfying e-commerce experience!\n\n"
                  "Privacy Policy\nTerms and Conditions\n\n",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign:
                      TextAlign.justify, // Justify the text for a clean look
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ProfileSt(
                  textLable: "Privacy Policy",
                  icon: Iconsax.key,
                  onTap: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ProfileSt(
                  textLable: "Terms and Conditions",
                  icon: Icons.group,
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Version: V8.1.2.5"),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
