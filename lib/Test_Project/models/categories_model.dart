class CategoriesModle {
  final String image;
  final String name;
  final int price;
  //final int quantity;
  final String category;
  CategoriesModle({
    required this.image,
    required this.name,
    required this.price,
    // required this.quantity,
    required this.category,
  });

  Map<String, dynamic> toJSON() => {
        "image": image,
        "name": name,
        "price": price,
        // "quantity": quantity,
        "category": category,
      };

  CategoriesModle.fromJson(Map<String, dynamic> map)
      : image = map["image"],
        name = map["name"],
        price = map["price"],
        //quantity = map["price"],
        category = map["category"];
}
