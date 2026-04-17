import 'package:flutter/material.dart';
import 'forget_password.dart'; // email
import 'forget_password_telephone.dart';
// import 'forgot_phone_screen.dart'; // nếu bạn làm thêm SĐT

class ChooseMethodScreen extends StatelessWidget {
  const ChooseMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Column(
          children: [
            // 🔷 Header
            Container(height: 100, width: double.infinity, color: Colors.teal),

            const SizedBox(height: 40),

            // 🔷 Title
            const Text(
              "Quên mật khẩu",
              style: TextStyle(fontFamily: "PlaywriteNZGuides", fontSize: 24),
            ),

            const SizedBox(height: 60),

            // 🔷 EMAIL
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );
              },
              child: const Text(
                "EMAIL",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🔷 SỐ ĐIỆN THOẠI
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPhoneScreen(),
                  ),
                );
              },
              child: const Text(
                "SỐ ĐIỆN THOẠI",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Spacer(),

            // 🔷 Thanh dưới
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: 120,
              height: 4,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
