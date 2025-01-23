import 'package:flutter/material.dart';
import 'package:fu_ecom/components/bannerPage.dart';
import 'package:fu_ecom/components/category_item.dart';
import 'package:fu_ecom/components/my_items.dart';
import 'package:fu_ecom/components/my_type.dart';
import 'package:fu_ecom/models/category_models.dart';
import 'package:fu_ecom/models/goods_model.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    final goodsProvider = Provider.of<GoodsProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25)),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const Icon(
                      Icons.notifications,
                      size: 28,
                    ),
                  ),
                  Image.network(
                    color:Theme.of(context).colorScheme.inverseSurface, 
                    "https://zandokh.com/image/catalog/logo/TEN11.png",
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart_page');
                          },
                          icon: const Icon(Iconsax.shopping_bag)),
                      Positioned(
                          right: 1,
                          top: 2,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: const Center(
                              child: Text(
                                "3",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const BannerPage(),

          MyType(onTap: () {}, textType: "Shop By Category"),
          // for more
          // SingleChildScrollView with horizontal scrolling
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                category.length,
                (index) => InkWell(
                  onTap: () {
                    // Filter selected items from the provider
                    final filterItem = goodsProvider.goodsList
                        .where((item) =>
                            item.category.toLowerCase() ==
                            category[index].name.toLowerCase())
                        .toList();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CategoryItem(
                                category: category[index].name,
                                categoryItem: filterItem)));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          width:
                              60, // Adjust the width to match your desired size
                          height:
                              60, // Adjust the height to match your desired size
                          decoration: BoxDecoration(
                            shape:
                                BoxShape.circle, // Makes the container circular
                            image: DecorationImage(
                              image: AssetImage(
                                category[index].image, // Your image
                              ),
                              fit: BoxFit
                                  .cover, // Ensures the image fits perfectly
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 8), // Space between avatar and name
                      Text(
                        category[index].name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          MyType(onTap: () {}, textType: "Shop By Category"),
          //organize items
          const MyItems(),
        ],
      ),
    );
  }
}
