import 'package:flutter/material.dart';
import 'package:fu_ecom/models/goods_model.dart';
import 'package:fu_ecom/pages/items_detail.dart';
import 'package:provider/provider.dart';

class MyItems extends StatelessWidget {
  // final void Function()? onTap;
  const MyItems({super.key});

  @override
  Widget build(BuildContext context) {
     // Access the GoodsProvider
    final goodsProvider = Provider.of<GoodsProvider>(context);
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 300, // Define height to avoid overflow issues
        child: ListView.builder(
          clipBehavior: Clip.hardEdge,
          scrollDirection: Axis.horizontal,
          // Horizontal scrolling
          itemCount: goodsProvider.goodsList.length,
          itemBuilder: (context, index) {
            final product = goodsProvider.goodsList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemsDetail(
                              eComerceApp: product,
                            )));
              },
              child: Padding(
                padding: EdgeInsets.only(
                  left:
                      index == 0 ? 20 : 0, // Add padding only for the first item
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Container
                    Container(
                      width: 210,
                      height: 230, // Set height for the image
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage(product.image),
                              fit: BoxFit.cover)),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.black12,
                              child: Icon(
                                //should make buttin function if click
                                Icons.favorite,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5), // Space between image and text
                    // Product Name
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "H&M",
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${product.rating}',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        Text(product.name),
                        Row(
                          children: [
                            if (product.discount != null && product.discount! > 0)
                              Text(
                                '\$${product.price}.00',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration
                                      .lineThrough, // Strike through original price
                                ),
                              ),
                            const SizedBox(width: 5),
                            Text(
                              '\$${product.discountedPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
