import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Icon(Icons.notifications),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Lunar New Year's around the Corner! 👗"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                'https://i.pinimg.com/originals/ba/43/48/ba4348e77b87b7612fd491661ca92afa.gif',
                fit: BoxFit
                    .cover, // Optionally, you can add fit to control how the image is scaled
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                  "Up to 70% OFF_celebrate early ameazing dear hear! Exolore Now!🌟 "),
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child:const Center(child: Text(
                "Shop Now",style: TextStyle(fontWeight: FontWeight.w900),
              ),)
                
              
              ),
               const SizedBox(
              height: 40,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Icon(Icons.notifications),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Lunar New Year's around the Corner! 👗"),
                  ],
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                'https://i.pinimg.com/originals/0a/b2/cb/0ab2cb3d634f15ff0142c2fc5b1f9aea.gif',
                fit: BoxFit
                    .cover, // Optionally, you can add fit to control how the image is scaled
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child:const Center(child: Text(
                "Shop Now",style: TextStyle(fontWeight: FontWeight.w900),
              ),)
                
              
              ),
          ],
        ),
      ),
    );
  }
}
