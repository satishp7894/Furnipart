class Customer {
  String? name;
  String? status;
  DateTime? dateTime;
  String? number;
  Customer({this.name, this.status, this.dateTime, this.number});

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    name: json["name"],
    status: json["status"],
    dateTime: json["dateTime"],
    number: json["number"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "status": status,
    "dateTime": dateTime,
    "number": number
  };
}