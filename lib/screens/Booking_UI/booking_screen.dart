import 'package:flutter/material.dart';
import 'package:ung_dung_thue_do_dung_ngan_han_nhom_10/models/rental_order.dart';
import 'package:ung_dung_thue_do_dung_ngan_han_nhom_10/services/auth_service.dart';
import 'package:ung_dung_thue_do_dung_ngan_han_nhom_10/services/order_service.dart';
import '../../models/product.dart';

class BookingScreen extends StatefulWidget {
  final Product product;

  const BookingScreen({super.key, required this.product});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? startDate;
  DateTime? endDate;

  // ===============================
  // PICK DATE
  // ===============================
  Future<void> pickDate(bool isStart) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  // ===============================
  // TÍNH SỐ NGÀY
  // ===============================
  int getTotalDays() {
    if (startDate == null || endDate == null) return 0;
    return endDate!.difference(startDate!).inDays + 1;
  }

  // ===============================
  // TÍNH TIỀN
  // ===============================
  double getTotalPrice() {
    return getTotalDays() * widget.product.price;
  }

  // ===============================
  // FORMAT DATE
  // ===============================
  String formatDate(DateTime? date) {
    if (date == null) return "";
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thuê sản phẩm"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // ===============================
            // NGÀY BẮT ĐẦU
            // ===============================
            ListTile(
              title: Text(
                startDate == null ? "Chọn ngày bắt đầu" : formatDate(startDate),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => pickDate(true),
            ),

            // ===============================
            // NGÀY KẾT THÚC
            // ===============================
            ListTile(
              title: Text(
                endDate == null ? "Chọn ngày kết thúc" : formatDate(endDate),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => pickDate(false),
            ),

            // ===============================
            // HIỂN THỊ TỔNG TIỀN
            // ===============================
            if (startDate != null && endDate != null) ...[
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Số ngày thuê:"),
                        Text("${getTotalDays()} ngày"),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Tổng tiền:"),
                        Text(
                          "${getTotalPrice().toStringAsFixed(0)} VNĐ",
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],

            const Spacer(),

            // ===============================
            // BUTTON
            // ===============================
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () async {
                if (startDate == null || endDate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Vui lòng chọn ngày")),
                  );
                  return;
                }

                // 🔥 validate ngày
                if (endDate!.isBefore(startDate!)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Ngày kết thúc phải sau ngày bắt đầu"),
                    ),
                  );
                  return;
                }

                final order = RentalOrder(
                  orderId: DateTime.now().millisecondsSinceEpoch.toString(),
                  username: AuthService.currentUser!,
                  product: widget.product,
                  startDate: formatDate(startDate),
                  endDate: formatDate(endDate),
                  status: "Chờ xác nhận",
                );

                await OrderService.addOrder(order);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Đặt thuê thành công")),
                );

                Navigator.pop(context);
              },
              child: const Text("Xác nhận thuê"),
            ),
          ],
        ),
      ),
    );
  }
}
