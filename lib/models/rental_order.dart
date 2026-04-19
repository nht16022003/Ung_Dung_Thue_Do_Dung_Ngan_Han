import 'product.dart';

class RentalOrder {
  final String orderId;
  final Product product;
  final String startDate;
  final String endDate;
  String status;

  RentalOrder({
    required this.orderId,
    required this.product,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}
