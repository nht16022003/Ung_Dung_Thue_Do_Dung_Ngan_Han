import 'package:flutter/material.dart';
import '../../widgets/Login/custom_button.dart';
import '../../widgets/Login/custom_textfield.dart';
import '../../services/auth_service.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String username;

  const ResetPasswordScreen({super.key, required this.username});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    passController.dispose();
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
            Container(height: 100, color: Colors.teal),

            const SizedBox(height: 40),

            const Text("Đặt lại mật khẩu", style: TextStyle(fontSize: 22)),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  CustomTextField(
                    hint: "Mật khẩu mới",
                    isPassword: true,
                    controller: passController,
                  ),

                  const SizedBox(height: 20),

                  CustomTextField(
                    hint: "Xác nhận mật khẩu",
                    isPassword: true,
                    controller: confirmController,
                  ),

                  const SizedBox(height: 30),

                  CustomButton(
                    text: "XÁC NHẬN",
                    onPressed: () async {
                      String pass = passController.text;
                      String confirm = confirmController.text;

                      if (pass != confirm) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Mật khẩu không khớp")),
                        );
                        return;
                      }

                      bool success = await AuthService.updatePassword(
                        widget.username,
                        pass,
                      );

                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Đổi mật khẩu thành công"),
                          ),
                        );

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
