import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/rental_order.dart';

class OrderService {
  static const String fileName = "orders.json";

  static Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File("${dir.path}/$fileName");
  }

  static Future<List<RentalOrder>> getOrders() async {
    try {
      final file = await _getFile();
      if (!await file.exists()) return [];

      final content = await file.readAsString();
      if (content.isEmpty) return [];

      List data = jsonDecode(content);
      return data.map((e) => RentalOrder.fromJson(e)).toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveOrders(List<RentalOrder> orders) async {
    final file = await _getFile();
    final data = orders.map((e) => e.toJson()).toList();
    await file.writeAsString(jsonEncode(data));
  }

  static Future<void> addOrder(RentalOrder order) async {
    final orders = await getOrders();
    orders.add(order);
    await saveOrders(orders);
  }
}
