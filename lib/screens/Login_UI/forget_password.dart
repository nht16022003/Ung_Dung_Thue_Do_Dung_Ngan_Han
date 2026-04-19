import 'package:flutter/material.dart';
import '../../widgets/Login/custom_button.dart';
import '../../widgets/Login/custom_textfield.dart';
import '../../services/auth_service.dart'; // 🔥 thêm
import '../../screens/Login_UI/waychange_forget_password.dart';
import 'otp.dart'; // 🔥 thêm

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 100, width: double.infinity, color: Colors.teal),

            const SizedBox(height: 40),

            const Text(
              "Quên mật khẩu",
              style: TextStyle(fontFamily: "PlaywriteNZGuides", fontSize: 24),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email:"),
                  const SizedBox(height: 5),

                  CustomTextField(
                    hint: "Nhập email",
                    controller: emailController,
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: CustomButton(
                        text: "GỬI YÊU CẦU",
                        onPressed: () async {
                          String email = emailController.text.trim();

                          if (email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Vui lòng nhập email"),
                              ),
                            );
                            return;
                          }

                          final users = await AuthService.getUsers();

                          // 🔥 kiểm tra email tồn tại
                          bool exists = users.any((u) => u.email == email);

                          if (!exists) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Email không tồn tại"),
                              ),
                            );
                            return;
                          }

                          // 🔥 lấy username theo email
                          String username = users
                              .firstWhere((u) => u.email == email)
                              .username;

                          // 👉 chuyển OTP
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OtpScreen(username: username),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // 🔥 Cách khác (GIỮ NGUYÊN)
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ChooseMethodScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Cách khác",
                        style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      ),
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
