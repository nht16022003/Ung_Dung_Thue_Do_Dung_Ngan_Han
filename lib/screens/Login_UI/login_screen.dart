import 'package:flutter/material.dart';
import '../../widgets/Login/custom_button.dart';
import '../../widgets/Login/custom_textfield.dart';
import '../../services/auth_service.dart';
import 'create_account_screen.dart';
import '../../screens/Login_UI/forget_password.dart'; // 🔥 thêm dòng này
import '../TrangChu_UI/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            const Text(
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

                  CustomTextField(
                    hint: "Nhập username",
                    controller: usernameController,
                  ),

                  const SizedBox(height: 20),

                  const Text("Mật khẩu:"),
                  const SizedBox(height: 5),

                  CustomTextField(
                    hint: "Nhập mật khẩu",
                    isPassword: true,
                    controller: passwordController,
                  ),

                  const SizedBox(height: 30),

                  // 🔷 Button
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: CustomButton(
                        text: "ĐĂNG NHẬP",
                        onPressed: () async {
                          String user = usernameController.text.trim();
                          String pass = passwordController.text.trim();

                          if (user.isEmpty || pass.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Vui lòng nhập đầy đủ"),
                              ),
                            );
                            return;
                          }

                          bool success = await AuthService.login(user, pass);

                          if (success) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Sai tài khoản hoặc mật khẩu"),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔷 Text dưới (ĐÃ FIX)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 🔴 Chưa có tài khoản
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CreateAccountScreen(),
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

                      // 🔥 QUÊN MẬT KHẨU (ĐÃ THÊM LẠI)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ForgotPasswordScreen(),
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
