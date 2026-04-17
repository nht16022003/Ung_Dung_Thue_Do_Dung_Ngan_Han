import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late Timer _timer; // 👈 lưu timer

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return; // 👈 fix crash

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // 👈 hủy timer khi rời màn
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(height: 100, width: double.infinity, color: Colors.teal),

            const SizedBox(height: 40),

            const Text(
              "Đăng ký thành công",
              style: TextStyle(fontFamily: "PlaywriteNZGuides", fontSize: 24),
            ),

            const SizedBox(height: 40),

            const Icon(
              Icons.check_circle_outline,
              size: 150,
              color: Colors.green,
            ),

            const SizedBox(height: 40),

            // Nút quay lại luôn (optional)
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text("ĐĂNG NHẬP"),
            ),

            const Spacer(),

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
