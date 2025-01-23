import 'package:flutter/material.dart';
import 'package:fu_ecom/models/category_models.dart';
import 'package:fu_ecom/models/goods_model.dart';
import 'package:fu_ecom/pages/items_detail.dart';
import 'package:iconsax/iconsax.dart';

class CategoryItem extends StatefulWidget {
  final String category;
  final List<GoodsModel> categoryItem;

  const CategoryItem({
    super.key,
    required this.category,
    required this.categoryItem,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  // for search
  final TextEditingController _searchCtr = TextEditingController();
  List<GoodsModel> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Initialize filtered items with all items
    _filteredItems = widget.categoryItem;
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = widget.categoryItem
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      controller: _searchCtr,
                      onChanged: _filterItems, // Call filter on text change
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Search ${widget.category}'s fashion",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[200],
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
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Filter Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filterCategory.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
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
            const SizedBox(height: 25),

            
            // Content Placeholder (e.g., Items List)
            Expanded(
              child: _filteredItems.isEmpty
                  ? Center(
                      child: Text(
                        "No items found in ${widget.category}.",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.56,
                      ),
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = _filteredItems[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemsDetail(
                                      
                                          eComerceApp: item,
                                        )));
                            print("Tapped on ${item.name}");
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