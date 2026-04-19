import 'package:flutter/material.dart';
import 'package:ung_dung_thue_do_dung_ngan_han_nhom_10/models/rental_order.dart';

class OrderDetailScreen extends StatelessWidget {
  final RentalOrder order;

  const OrderDetailScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryCyan = Color.fromARGB(255, 77, 225, 102);
    const Color backgroundMint = Color(0xFFF4FDF9);

    // Tùy chỉnh màu trạng thái giống trang trước
    Color statusColor = Colors.green;
    if (order.status == "Chờ xác nhận") statusColor = Colors.orange;
    if (order.status == "Đã hủy") statusColor = Colors.red;

    return Scaffold(
      backgroundColor: backgroundMint,
      appBar: AppBar(
        backgroundColor: primaryCyan,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Chi tiết đơn thuê",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh thiết bị
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(
                    order.product.image,
                  ), // Dùng AssetImage cho ảnh local
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Thông tin thiết bị
            Text(
              order.product.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Loại: ${order.product.category}",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            const Divider(),

            // Thông tin thuê
            const SizedBox(height: 16),
            const Text(
              "Thông tin đơn thuê",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.receipt_long, "Mã đơn", order.orderId),
            _buildInfoRow(Icons.calendar_today, "Bắt đầu", order.startDate),
            _buildInfoRow(Icons.event_available, "Kết thúc", order.endDate),
            _buildInfoRow(
              Icons.attach_money,
              "Giá thuê",
              "${order.product.price.toStringAsFixed(0)} VNĐ/ngày",
            ),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            // Trạng thái đơn
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Trạng thái:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor),
                  ),
                  child: Text(
                    order.status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget con để code gọn gàng hơn
  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          const SizedBox(width: 8),
          Text(
            "$title: ",
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
