class Total {

  int? price;
  int? qty;
  int? index;
  Total({ this.price,this.qty,this.index});

  factory Total.fromJson(Map<String, dynamic> json) => Total(

      price: json["price"],
      qty: json["qty"],
      index: json["index"]
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "qty": qty,
    "index": index
  };

}