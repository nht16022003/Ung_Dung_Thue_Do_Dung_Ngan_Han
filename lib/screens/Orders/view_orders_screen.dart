import 'package:flutter/material.dart';
import '../../models/rental_order.dart';
import '../../services/order_service.dart'; // 🔥 thêm
import '../../services/auth_service.dart'; // 🔥 thêm
import 'order_detail_screen.dart';

class ViewOrdersScreen extends StatefulWidget {
  const ViewOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ViewOrdersScreen> createState() => _ViewOrdersScreenState();
}

class _ViewOrdersScreenState extends State<ViewOrdersScreen> {
  List<RentalOrder> orders = []; // 🔥 thay mockOrders

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  Future<void> loadOrders() async {
    final all = await OrderService.getOrders();

    setState(() {
      // 🔥 lọc theo user đăng nhập
      orders = all.where((o) => o.username == AuthService.currentUser).toList();
    });
  }

  // ===============================
  // HỦY ĐƠN
  // ===============================
  void _showCancelDialog(RentalOrder order) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text("Xác nhận hủy đơn"),
          content: Text("Bạn có chắc chắn muốn hủy ${order.product.name}?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Không"),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);

                setState(() {
                  order.status = "Đã hủy";
                });

                // 🔥 cập nhật lại file JSON
                final all = await OrderService.getOrders();
                await OrderService.saveOrders(all);

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Đã hủy đơn")));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Hủy đơn"),
            ),
          ],
        );
      },
    );
  }

  void _onOrderTapped(RentalOrder order) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => OrderDetailScreen(order: order)),
    );
  }

  // ===============================
  // UI
  // ===============================
  @override
  Widget build(BuildContext context) {
    const primary = Colors.teal;
    const bg = Color(0xFFF4FDF9);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text("Đơn thuê của tôi"),
        centerTitle: true,
      ),

      body: orders.isEmpty
          ? const Center(child: Text("Chưa có đơn nào"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final product = order.product;

                Color statusColor = Colors.green;
                if (order.status == "Chờ xác nhận") statusColor = Colors.orange;
                if (order.status == "Đã hủy") statusColor = Colors.red;

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () => _onOrderTapped(order),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          // IMAGE
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(product.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          // INFO
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text("Giá: ${product.price} VNĐ/ngày"),

                                Text(
                                  "TG: ${order.startDate} - ${order.endDate}",
                                ),

                                const SizedBox(height: 8),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      order.status,
                                      style: TextStyle(
                                        color: statusColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    if (order.status == "Chờ xác nhận")
                                      ElevatedButton(
                                        onPressed: () =>
                                            _showCancelDialog(order),
                                        child: const Text("Hủy"),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
