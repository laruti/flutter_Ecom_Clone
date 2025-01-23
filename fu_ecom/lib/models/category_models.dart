// Declare the Category class outside the widget
class Category {
  final String name, image;
  Category({required this.image, required this.name});
}

// List of categories
List<Category> category = [
  Category(image: "lib/image/womenAv2.jpg", name: "women"),
  Category(image: "lib/image/MenModel02.jpg", name: "men"),
  Category(image: "lib/image/hat.jpg", name: "Hat"),
  Category(image: "lib/image/shoes.jpg", name: "Shoes"),
  Category(image: "lib/image/belt.jpg", name: "Accessories"),
  Category(image: "lib/image/av_kid01.jpeg", name: "kid"),
 
];

class MainItem {
  final String name, image;
  MainItem({required this.image, required this.name});
}

List<MainItem> mainItem = [
  MainItem(image: "lib/image/av_women.webp", name: "women"),
  MainItem(image: "lib/image/av_men.jpeg", name: "men"),
  MainItem(image: "lib/image/av_women.webp", name: "women"),
  MainItem(image: "lib/image/av_men.jpeg", name: "men"),
  MainItem(image: "lib/image/av_women.webp", name: "women"),
  MainItem(image: "lib/image/av_men.jpeg", name: "men"),
];
List<String> filterCategory = [
  "filter",
  "Ratings",
  "Size",
  "Color",
  "Price",
  "Brand",
];
