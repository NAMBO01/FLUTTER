class Product {
  final String name;
  final String hinh;
  final String price;

  Product({
    required this.name,
    required this.hinh,
    required this.price,
  });

  factory Product.fromJSON(Map<String, dynamic> json) {
    return Product(
      name: json["tensp"],
      hinh: json["hinh"],
      price: json["gia"].toString(),
    );
  }
}
