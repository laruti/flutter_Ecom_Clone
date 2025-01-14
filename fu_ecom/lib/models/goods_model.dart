import 'package:flutter/material.dart';

class GoodsModel {
  final String name, image, description, category;
  final double rating;
  final int review, price;
  final double? discount; // Discount percentage
  final List<Color> fcolor;
  final List<String> size;
  bool isCheck;

  GoodsModel({
    required this.name,
    required this.image,
    required this.description,
    required this.category,
    required this.rating,
    required this.review,
    required this.price,
    this.discount,
    required this.isCheck,
    required this.fcolor,
    required this.size,
  });

  double get discountedPrice {
    if (discount != null && discount! > 0) {
      return price - (price * discount! / 100);
    }
    return price.toDouble();
  }
}

class GoodsProvider with ChangeNotifier {
  List<GoodsModel> _goodsList = [
    GoodsModel(
      name: "Oversized Fit Print T-Shirt WoMen",
      image: "lib/image/women001.jpg",
      description: "The best product for last year and trending in my store.",
      category: "Women",
      rating: 4.9,
      review: 136,
      price: 1,
      discount: 0, // No discount
      isCheck: true,
      fcolor: [
        Colors.black,
        Colors.blue,
        Colors.blue[100]!,
      ],
      size: ["S", "L", "XL"],
    ),
    GoodsModel(
      name: "Oversized Fit Print T-Shirt Women",
      image: "lib/image/women003.jpg",
      description: "Popular among customers for its comfort and style.",
      category: "Women",
      rating: 4.9,
      review: 136,
      price: 12,
      discount: 0, // No discount
      isCheck: true,
      fcolor: [
        Colors.black,
        Colors.blue,
        Colors.blue[100]!,
      ],
      size: ["S", "L", "XL"],
    ),
    GoodsModel(
      name: "Oversized Fit Print T-Shirt",
      image: "lib/image/women002.jpg",
      description: "A comfortable T-shirt perfect for casual outings.",
      category: "Women",
      rating: 4.9,
      review: 136,
      price: 30,
      discount: 20, // 20% discount
      isCheck: true,
      fcolor: [
        Colors.black,
        Colors.blue,
        Colors.blue[100]!,
      ],
      size: ["S", "M", "L", "XL"],
    ),
    GoodsModel(
      name: "Oversized Fit Print T-Shirt Men",
      image: "lib/image/pr_01.jpg",
      description: "Great for everyday wear.",
      category: "Men",
      rating: 4.9,
      review: 136,
      price: 1,
      discount: 20, // 20% discount
      isCheck: true,
      fcolor: [
        Colors.black,
        Colors.blue,
        Colors.blue[100]!,
      ],
      size: ["S", "M", "L", "XL"],
    ),
    GoodsModel(
      name: "Oversized Fit Print T-Shirt Kid",
      image: "lib/image/kid001.jpg",
      description: "Fun and stylish for kids.",
      category: "Kid",
      rating: 4.9,
      review: 136,
      price: 40,
      discount: null, // No discount
      isCheck: true,
      fcolor: [
        Colors.black,
        Colors.blue,
        Colors.blue[100]!,
      ],
      size: ["S", "M", "L", "XL"],
    ),
    GoodsModel(
      name: "Oversized Fit Print T-Shirt Women",
      image: "lib/image/women004.jpg",
      description: "A must-have for every wardrobe.",
      category: "Women",
      rating: 4.9,
      review: 136,
      price: 1,
      discount: 0, // No discount
      isCheck: true,
      fcolor: [
        Colors.black,
        Colors.blue,
        Colors.blue[100]!,
      ],
      size: ["S", "L", "XL"],
    ),
  ];

  List<GoodsModel> get goodsList => _goodsList;

  void toggleCheck(GoodsModel item) {
    item.isCheck = !item.isCheck;
    notifyListeners();
  }
}