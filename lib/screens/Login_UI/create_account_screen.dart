import 'package:flutter/material.dart';
import '../../widgets/Login/custom_button.dart';
import '../../widgets/Login/custom_textfield.dart';
import '../../services/auth_service.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController(); // 🔥 thêm
  final phoneController = TextEditingController(); // 🔥 thêm
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose(); // 🔥 thêm
    phoneController.dispose(); // 🔥 thêm
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Column(
          children: [
            // 🔷 Header (GIỮ NGUYÊN)
            Container(height: 100, width: double.infinity, color: Colors.teal),

            const SizedBox(height: 20),

            const Text(
              "Đăng ký tài khoản",
              style: TextStyle(fontFamily: "PlaywriteNZGuides", fontSize: 24),
            ),

            const SizedBox(height: 25),

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

                  const SizedBox(height: 15),

                  // 🔥 EMAIL
                  const Text("Email:"),
                  const SizedBox(height: 5),

                  CustomTextField(
                    hint: "Nhập email",
                    controller: emailController,
                  ),

                  const SizedBox(height: 15),

                  // 🔥 SĐT
                  const Text("Số điện thoại:"),
                  const SizedBox(height: 5),

                  CustomTextField(
                    hint: "Nhập số điện thoại",
                    controller: phoneController,
                  ),

                  const SizedBox(height: 15),

                  const Text("Mật khẩu:"),
                  const SizedBox(height: 5),

                  CustomTextField(
                    hint: "Nhập mật khẩu",
                    isPassword: true,
                    controller: passwordController,
                  ),

                  const SizedBox(height: 15),

                  const Text("Xác nhận mật khẩu:"),
                  const SizedBox(height: 5),

                  CustomTextField(
                    hint: "Nhập lại mật khẩu",
                    isPassword: true,
                    controller: confirmController,
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: CustomButton(
                        text: "ĐĂNG KÝ",
                        onPressed: () async {
                          String user = usernameController.text.trim();
                          String email = emailController.text.trim();
                          String phone = phoneController.text.trim();
                          String pass = passwordController.text.trim();
                          String confirm = confirmController.text.trim();

                          // 🔥 VALIDATE
                          if (user.isEmpty ||
                              email.isEmpty ||
                              phone.isEmpty ||
                              pass.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Nhập đầy đủ thông tin"),
                              ),
                            );
                            return;
                          }

                          if (pass != confirm) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Mật khẩu không khớp"),
                              ),
                            );
                            return;
                          }

                          // 🔥 gọi service mới
                          bool success = await AuthService.register(
                            user,
                            pass,
                            email,
                            phone,
                          );

                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Đăng ký thành công"),
                              ),
                            );
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Tài khoản đã tồn tại"),
                              ),
                            );
                          }
                        },
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
