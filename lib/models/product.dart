class Product {
  String id;
  String name;
  String image;
  double price;
  String category;
  String? subCategory;
  String? description;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    this.subCategory,
    this.description,
  });

  // 🔥 Object → JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "category": category,
    "subCategory": subCategory,
    "description": description,
  };

  // 🔥 JSON → Object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      price: (json["price"] ?? 0).toDouble(),
      category: json["category"] ?? "",
      subCategory: json["subCategory"],
      description: json["description"],
    );
  }
}
