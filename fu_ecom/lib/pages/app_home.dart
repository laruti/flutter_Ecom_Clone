import 'package:flutter/material.dart';
import 'package:fu_ecom/components/category_item.dart';
import 'package:fu_ecom/components/my_items.dart';
import 'package:fu_ecom/components/my_type.dart';
import 'package:fu_ecom/models/category_models.dart';
import 'package:fu_ecom/models/goods_model.dart';
import 'package:fu_ecom/pages/banner.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    final goodsProvider = Provider.of<GoodsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20)),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    // child: Image.network(
                    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJcDQB644Fc-U8OaS4YASXkk1XbcH-hOeMfw&s",
                    //   width: 40,
                    //   height: 40,
                    //   fit: BoxFit.cover,
                    // ),
                    child: Icon(
                      Icons.notifications,
                      size: 28,
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Iconsax.shopping_bag,
                        size: 28,
                      ),
                      Positioned(
                          right: -3,
                          top: -4,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: Center(
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
          BannerPage(),

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
                    final filterItem = goodsProvider.goodsList.where((item) =>
                      item.category.toLowerCase() == category[index].name.toLowerCase()
                    ).toList();
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        style: TextStyle(
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
