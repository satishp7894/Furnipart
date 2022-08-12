class Product {
  String? name;
  String? description;
  int? price;
  int? qty;
  Product({this.name, this.description, this.price,this.qty});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      name: json["name"],
      description: json["description"],
      price: json["price"],
      qty: json["qty"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "price": price,
    "qty": qty
  };

}