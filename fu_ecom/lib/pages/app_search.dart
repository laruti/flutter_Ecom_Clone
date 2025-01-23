import 'package:flutter/material.dart';
import 'package:fu_ecom/models/category_models.dart';
import 'package:fu_ecom/models/goods_model.dart';
import 'package:fu_ecom/pages/items_detail.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class AppSearch extends StatefulWidget {
  const AppSearch({super.key});

  @override
  State<AppSearch> createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {
  TextEditingController __searchCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final goodsProvider = Provider.of<GoodsProvider>(context);

    // Function to filter the goods based on search query
    List<GoodsModel> filteredGoods = goodsProvider.goodsList
        .where((item) => item.name
            .toLowerCase()
            .contains(__searchCtr.text.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.inversePrimary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              
                 child: Expanded(
                    child: TextField(
                      controller: __searchCtr,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Search name's fashion",
                        hintStyle: TextStyle(color: Theme.of(context).colorScheme.surface),
                        filled: true,
                        fillColor:Theme.of(context).colorScheme.secondary,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(
                          Iconsax.search_normal,
                          color: Colors.black38,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          // Trigger re-build when the search query changes
                        });
                      },
                    ),
                  ),
             
            ),
            const SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filterCategory.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          // Implement category filter here
                          // Update the UI based on the selected category
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black38),
                          ),
                          child: Row(
                            children: [
                              Text(
                                filterCategory[index],
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                index == 0 ? Icons.filter_list : Icons.keyboard_arrow_down,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              
              child: filteredGoods.isEmpty
                  ? Center(
                      child: Text(
                        "No items found",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    )
                  : GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  
                  
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.60,
                      ),
                      itemCount: filteredGoods.length,
                      itemBuilder: (context, index) {
                        final item = filteredGoods[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemsDetail(
                                  eComerceApp: item,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image Container
                              Container(
                                height: size.height * 0.25,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: AssetImage(item.image),
                                        fit: BoxFit.cover)),
                                child: const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.black12,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Product Name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                        '${item.rating}',
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(item.name),
                                  Row(
                                    children: [
                                      if (item.discount != null && item.discount! > 0)
                                        Text(
                                          '\$${item.price}.00',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '\$${item.discountedPrice.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
