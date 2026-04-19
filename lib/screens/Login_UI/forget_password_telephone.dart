import 'package:flutter/material.dart';
import '../../widgets/Login/custom_button.dart';
import '../../widgets/Login/custom_textfield.dart';
import '../../services/auth_service.dart';
import 'otp.dart';

class ForgotPhoneScreen extends StatefulWidget {
  const ForgotPhoneScreen({super.key});

  @override
  State<ForgotPhoneScreen> createState() => _ForgotPhoneScreenState();
}

class _ForgotPhoneScreenState extends State<ForgotPhoneScreen> {
  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
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
                  const Text("Số điện thoại"),
                  const SizedBox(height: 5),

                  CustomTextField(
                    hint: "Nhập số điện thoại",
                    controller: phoneController,
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: CustomButton(
                        text: "GỬI YÊU CẦU",
                        onPressed: () async {
                          String phone = phoneController.text.trim();

                          if (phone.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Vui lòng nhập số điện thoại"),
                              ),
                            );
                            return;
                          }

                          final users = await AuthService.getUsers();

                          // 🔥 FIX: tìm theo phone
                          bool exists = users.any((u) => u.phone == phone);

                          if (!exists) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("SĐT không tồn tại"),
                              ),
                            );
                            return;
                          }

                          // 🔥 lấy username theo phone
                          String username = users
                              .firstWhere((u) => u.phone == phone)
                              .username;

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

                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
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
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
