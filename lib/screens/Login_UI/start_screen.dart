import 'package:flutter/material.dart';
import 'login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Column(
          children: [
            // 🔷 Header xanh
            Container(height: 100, width: double.infinity, color: Colors.teal),

            const SizedBox(height: 20),

            // 🔷 Text welcome
            const Text(
              "Welcome to Rent equipment",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),

            const SizedBox(height: 15),

            // 🔷 Nút mũi tên tròn
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward),
              ),
            ),

            const SizedBox(height: 20),

            // 🔷 Logo / hình minh họa
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/logo.png", // thay bằng ảnh của bạn
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔷 Thanh nhỏ dưới cùng
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: 100,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
