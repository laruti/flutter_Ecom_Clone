import 'package:flutter/material.dart';
import 'package:fu_ecom/components/btnAdd.dart';
import 'package:fu_ecom/models/goods_model.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ItemsDetail extends StatefulWidget {
  final GoodsModel eComerceApp;

  const ItemsDetail({
    super.key,
    required this.eComerceApp,
  });

  @override
  State<ItemsDetail> createState() => _ItemsDetailState();
}

// for show detail
class _ItemsDetailState extends State<ItemsDetail> {
  int currenIndex = 0;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;
  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Add your item to the cart"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () => {
              Navigator.pop(context),
              context.read<GoodsProvider>().addToCart(widget.eComerceApp)
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
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
              ))
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Image Slider Section
            SizedBox(
              height: size.height * 0.46,
              width: size.width,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currenIndex = value;
                  });
                },
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        widget.eComerceApp.image,
                        width: size.width * 0.8,
                        height: size.height * 0.4,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      // Page Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 4),
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == currenIndex
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 5),
            // Item Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand and Rating Row
                  Row(
                    children: [
                      const Text(
                        "H&M",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.eComerceApp.rating}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.favorite)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Description
                  Text(
                    widget.eComerceApp.name,
                    style:  TextStyle(
                      fontSize: 14,
                      color:Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Price Row
                  Row(
                    children: [
                      if (widget.eComerceApp.discount != null &&
                          widget.eComerceApp.discount! > 0)
                        Text(
                          '\$${widget.eComerceApp.price}.00',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const SizedBox(width: 5),
                      Text(
                        '\$${widget.eComerceApp.discountedPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${widget.eComerceApp.description}${widget.eComerceApp.name}',
                    style:  TextStyle(fontSize: 16, color:Theme.of(context).colorScheme.primary),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Color",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: widget.eComerceApp.fcolor
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final index = entry.key;
                                    final color = entry.value;
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 10),
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: color,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedColorIndex = index;
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color: selectedColorIndex == index
                                                ? Colors.white
                                                : Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Size",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: widget.eComerceApp.size
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final index = entry.key;
                                    final String size = entry.value;
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColorIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 10, top: 10),
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedSizeIndex == index
                                              ? Colors.black
                                              : Colors.white,
                                          border: Border.all(
                                              color: selectedColorIndex == index
                                                  ? Colors.black
                                                  : Colors.black12),
                                        ),
                                        child: Center(
                                          child: Text(
                                            size,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    selectedSizeIndex == index
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: null,
        label: SizedBox(
          width: size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add to Cart Button
              Btnadd(
                onTap: () => addToCart(context),
                text: "Add to Cart",
                color: Colors.white,
                colorfn: Colors.black,
                iconData: Icons.shopping_bag,
              ),
              const SizedBox(width: 10),
              // Buy Now Button
              Btnadd(
                onTap: () {},
                text: "Buy Now",
                color: Colors.black,
                colorfn: Colors.white,
                iconData: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
