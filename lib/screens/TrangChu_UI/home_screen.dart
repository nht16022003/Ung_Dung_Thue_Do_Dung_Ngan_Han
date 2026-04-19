import 'package:flutter/material.dart';
import 'package:ung_dung_thue_do_dung_ngan_han_nhom_10/screens/Orders/view_orders_screen.dart';
import '../../services/product_service.dart';
import '../../models/product.dart';
import '../../widgets/home/home_search_bar.dart';
import '../../widgets/home/category_chip.dart';
import '../../widgets/home/product_card.dart';
import '../../services/category_service.dart';
import '../../models/category.dart';
import '../../screens/orders/view_orders_screen.dart' hide ViewOrdersScreen;
import '../../screens/Information_UI/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = ProductService.getProducts();

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      // 🔥 Drawer (đúng vị trí)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              accountName: Text("Xin chào 👋"),
              accountEmail: Text("user@gmail.com"),
            ),

            ListTile(
              leading: const Icon(Icons.person, color: Colors.teal),
              title: const Text(
                "Thông tin cá nhân",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context); // đóng drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.receipt_long,
                color: Colors.teal,
              ), // Icon tờ biên lai
              title: const Text(
                "Đơn thuê của tôi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context); // Tự động đóng cái menu trượt lại
                Navigator.push(
                  // Chuyển sang màn hình của mày
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ViewOrdersScreen(),
                  ),
                );
              },
            ),

            // Thêm 1 cái đường gạch ngang cho nó tách biệt cho đẹp
            const Divider(),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Tất cả"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.kitchen),
              title: const Text("Gia dụng"),
            ),

            ListTile(
              leading: const Icon(Icons.kitchen),
              title: const Text("Sự kiện"),
            ),

            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Điện tử"),
            ),

            ListTile(
              leading: const Icon(Icons.park),
              title: const Text("Du lịch"),
            ),

            ListTile(
              leading: const Icon(Icons.celebration),
              title: const Text("Sự kiện"),
            ),

            ListTile(
              leading: const Icon(Icons.kitchen),
              title: const Text("Thời trang"),
            ),
          ],
        ),
      ),

      // 🔷 AppBar
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Thuê đồ"),
      ),

      // 🔷 Body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search
            const HomeSearchBar(),

            // 🎉 Banner
            SizedBox(
              height: 150,
              child: PageView(
                children: [
                  Image.asset("assets/images/logo.png", fit: BoxFit.cover),
                  Image.asset("assets/images/logo.png", fit: BoxFit.cover),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 🏷️ Category
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(name: "Tất cả", isSelected: true),
                  CategoryChip(name: "Gia dụng"),
                  CategoryChip(name: "Điện tử"),
                  CategoryChip(name: "Du lịch"),
                  CategoryChip(name: "Sự kiện"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 🔥 Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "🔥 Nổi bật",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // 🛍️ Grid sản phẩm
            GridView.builder(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
