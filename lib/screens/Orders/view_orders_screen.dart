import 'package:flutter/material.dart';
import 'package:ung_dung_thue_do_dung_ngan_han_nhom_10/models/rental_order.dart';
import 'package:ung_dung_thue_do_dung_ngan_han_nhom_10/models/product.dart';
import 'order_detail_screen.dart';

class ViewOrdersScreen extends StatefulWidget {
  const ViewOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ViewOrdersScreen> createState() => _ViewOrdersScreenState();
}

class _ViewOrdersScreenState extends State<ViewOrdersScreen> {
  // Tạo Dummy Data dạng List thường để có thể chỉnh sửa phần tử bên trong
  List<RentalOrder> mockOrders = [
    RentalOrder(
      orderId: "DH001",
      product: Product(
        id: "P01",
        name: "Lều cắm trại 4 người",
        image: "assets/images/image.png",
        price: 150000,
        category: "Dã ngoại",
      ),
      startDate: "20/04/2026",
      endDate: "22/04/2026",
      status: "Chờ xác nhận", // Trạng thái này sẽ hủy được
    ),
    RentalOrder(
      orderId: "DH002",
      product: Product(
        id: "P02",
        name: "Máy ảnh DSLR Canon",
        image: "assets/images/a.jpg",
        price: 300000,
        category: "Điện tử",
      ),
      startDate: "25/04/2026",
      endDate: "26/04/2026",
      status: "Đang thuê", // Trạng thái này không có nút hủy
    ),
  ];

  // ==========================================
  // CÁC HÀM XỬ LÝ TƯƠNG TÁC (CLICK) Ở ĐÂY
  // ==========================================

  // Hàm 1: Xử lý khi bấm nút Hủy đơn (Hiển thị Popup xác nhận)
  void _showCancelDialog(RentalOrder order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text("Xác nhận hủy đơn"),
          content: Text(
            "Bạn có chắc chắn muốn hủy đơn thuê ${order.product.name} không?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng popup
              },
              child: const Text("Không", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Đóng popup trước
                Navigator.of(context).pop();

                // Cập nhật trạng thái và load lại UI
                setState(() {
                  order.status = "Đã hủy";
                });

                // Hiển thị thông báo góc dưới
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Đã hủy đơn ${order.orderId} thành công!'),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                "Hủy đơn",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  // Hàm 2: Xử lý khi bấm vào cả cái Card đơn hàng
  void _onOrderTapped(RentalOrder order) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderDetailScreen(order: order)),
    );
  }

  // ==========================================
  // GIAO DIỆN CHÍNH
  // ==========================================
  @override
  Widget build(BuildContext context) {
    const Color primaryCyan = Color.fromARGB(255, 77, 225, 102);
    const Color backgroundMint = Color(0xFFF4FDF9);

    return Scaffold(
      backgroundColor: backgroundMint,
      appBar: AppBar(
        backgroundColor: primaryCyan,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Đơn thuê của tôi",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockOrders.length,
        itemBuilder: (context, index) {
          final order = mockOrders[index];
          final product = order.product;

          // Xử lý màu sắc dựa theo trạng thái
          Color statusColor = Colors.green;
          if (order.status == "Chờ xác nhận") statusColor = Colors.orange;
          if (order.status == "Đã hủy") statusColor = Colors.red;

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            // Dùng InkWell để tạo hiệu ứng click gợn sóng cho cả Card
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => _onOrderTapped(order), // Gọi hàm click thẻ
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hình ảnh
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(product.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Thông tin
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Giá: ${product.price.toStringAsFixed(0)} VNĐ/ngày",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "TG: ${order.startDate} - ${order.endDate}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Trạng thái và Nút Hủy
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                order.status,
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              // Chỉ hiện nút hủy khi ở trạng thái 'Chờ xác nhận'
                              if (order.status == "Chờ xác nhận")
                                ElevatedButton(
                                  onPressed: () => _showCancelDialog(
                                    order,
                                  ), // Gọi hàm hiển thị Popup
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryCyan,
                                    foregroundColor: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    elevation: 2,
                                  ),
                                  child: const Text("Hủy đơn"),
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
