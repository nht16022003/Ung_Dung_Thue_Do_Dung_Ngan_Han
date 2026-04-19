import 'package:flutter/material.dart';
import '../../services/product_service.dart';
import '../../models/product.dart';
import '../../widgets/home/product_card.dart';
import '../../screens/Information_UI/profile_screen.dart';
import 'package:ung_dung_thue_do_dung_ngan_han_nhom_10/screens/Orders/view_orders_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFilter = "Tất cả";

  List<Product> originalProducts = [];
  List<Product> allProducts = [];
  List<Product> visibleProducts = [];

  final int step = 5;
  int currentMax = 5;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    originalProducts = ProductService.getProducts();
    allProducts = originalProducts;

    visibleProducts = allProducts.take(step).toList();

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      loadMore();
    }
  }

  void loadMore() {
    if (currentMax >= allProducts.length) return;

    setState(() {
      currentMax += step;

      if (currentMax > allProducts.length) {
        currentMax = allProducts.length;
      }

      visibleProducts = allProducts.take(currentMax).toList();
    });
  }

  void applyFilter(String name) {
    setState(() {
      selectedFilter = name;

      if (name == "Tất cả") {
        allProducts = originalProducts;
      } else {
        allProducts = originalProducts.where((p) {
          return p.category == name || p.subCategory == name;
        }).toList();
      }

      currentMax = step;
      visibleProducts = allProducts.take(step).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Thuê đồ"),
      ),

      // ================= BODY =================
      body: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(10),
        itemCount: visibleProducts.length + 1,
        cacheExtent: 500,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          if (index == visibleProducts.length) {
            return currentMax < allProducts.length
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox();
          }

          return RepaintBoundary(
            child: ProductCard(product: visibleProducts[index]),
          );
        },
      ),

      // ================= DRAWER =================
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),

            // 🔥 THÔNG TIN CÁ NHÂN
            ListTile(
              leading: const Icon(Icons.person, color: Colors.teal),
              title: const Text("Thông tin cá nhân"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),

            // 🔥 ĐƠN THUÊ
            ListTile(
              leading: const Icon(Icons.receipt_long, color: Colors.teal),
              title: const Text("Đơn thuê của tôi"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ViewOrdersScreen()),
                );
              },
            ),

            const Divider(),

            // 🔥 FILTER
            _buildItem("Tất cả"),
            _buildItem("Điện tử"),
            _buildItem("Gia dụng"),
            _buildItem("Du lịch"),
            _buildItem("Sự kiện"),
            _buildItem("Thời trang"),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String name) {
    return ListTile(
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
        applyFilter(name);
      },
    );
  }
}
