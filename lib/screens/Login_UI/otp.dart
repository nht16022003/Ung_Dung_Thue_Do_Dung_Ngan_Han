import 'package:flutter/material.dart';
import 'reset_password_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
              "Nhập mã xác nhận",
              style: TextStyle(fontFamily: "PlaywriteNZGuides", fontSize: 24),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("OTP:"),
                  const SizedBox(height: 5),

                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text("XÁC NHẬN"),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Center(
                    child: Text(
                      "Gửi lại:",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
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
