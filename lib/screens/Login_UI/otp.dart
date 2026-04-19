import 'package:flutter/material.dart';
import 'reset_password_screen.dart';

class OtpScreen extends StatelessWidget {
  final String username;

  const OtpScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 100, color: Colors.teal),

            const SizedBox(height: 40),

            const Text("Nhập OTP", style: TextStyle(fontSize: 22)),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  TextField(
                    controller: otpController,
                    decoration: const InputDecoration(
                      hintText: "Nhập OTP (123456)",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {
                      if (otpController.text == "123456") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ResetPasswordScreen(username: username),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("OTP sai")),
                        );
                      }
                    },
                    child: const Text("XÁC NHẬN"),
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
