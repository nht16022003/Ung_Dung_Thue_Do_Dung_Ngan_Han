import 'package:flutter/material.dart';
import 'package:ung_dung_thue_do_dung_ngan_han_nhom_10/widgets/Login/custom_button.dart';
import 'package:ung_dung_thue_do_dung_ngan_han_nhom_10/widgets/Login/custom_textfield.dart';
import 'create_account_screen.dart';
import 'forget_password.dart';
import '../TrangChu_UI/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Column(
          children: [
            // 🔷 Header
            Container(height: 100, width: double.infinity, color: Colors.teal),

            const SizedBox(height: 30),

            // 🔷 Title
            Text(
              "Đăng nhập vào hệ thống",
              style: TextStyle(fontFamily: "PlaywriteNZGuides", fontSize: 22),
            ),

            const SizedBox(height: 30),

            // 🔷 Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Tên đăng nhập:"),
                  const SizedBox(height: 5),

                  // 👉 DÙNG WIDGET
                  const CustomTextField(hint: "Nhập username"),

                  const SizedBox(height: 20),

                  const Text("Mật khẩu:"),
                  const SizedBox(height: 5),

                  // 👉 DÙNG WIDGET
                  const CustomTextField(
                    hint: "Nhập mật khẩu",
                    isPassword: true,
                  ),

                  const SizedBox(height: 30),

                  // 🔷 Button
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: CustomButton(
                        text: "ĐĂNG NHẬP",
                        onPressed: () {
                          // 👉 giả sử đăng nhập đúng
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔷 Text dưới
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateAccountScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Chưa có tài khoản?",
                          style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Quên mật khẩu?",
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
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
