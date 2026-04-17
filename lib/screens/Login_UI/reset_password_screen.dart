import 'package:flutter/material.dart';
import '../../widgets/Login/custom_button.dart';
import '../../widgets/Login/custom_textfield.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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

            const SizedBox(height: 40),

            // 🔷 Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Mật khẩu mới:"),
                  const SizedBox(height: 5),

                  const CustomTextField(
                    hint: "Nhập mật khẩu mới",
                    isPassword: true,
                  ),

                  const SizedBox(height: 20),

                  const Text("Xác nhận mật khẩu mới:"),
                  const SizedBox(height: 5),

                  const CustomTextField(
                    hint: "Nhập lại mật khẩu",
                    isPassword: true,
                  ),

                  const SizedBox(height: 30),

                  // 🔷 Button
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: CustomButton(
                        text: "XÁC NHẬN",
                        onPressed: () {
                          // 👉 quay về login sau khi đổi thành công
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ),
                  ),
                ],
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
