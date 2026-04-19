import 'product.dart';

class RentalOrder {
  String orderId;
  String username; // 🔥 gắn với user
  Product product;
  String startDate;
  String endDate;
  String status;

  RentalOrder({
    required this.orderId,
    required this.username,
    required this.product,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "username": username,
    "product": product.toJson(),
    "startDate": startDate,
    "endDate": endDate,
    "status": status,
  };

  factory RentalOrder.fromJson(Map<String, dynamic> json) {
    return RentalOrder(
      orderId: json["orderId"],
      username: json["username"] ?? "",
      product: Product.fromJson(json["product"]),
      startDate: json["startDate"],
      endDate: json["endDate"],
      status: json["status"],
    );
  }
}
