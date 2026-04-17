import 'package:flutter/material.dart';
import '../../widgets/Login/custom_button.dart';
import '../../widgets/Login/custom_textfield.dart';
import 'otp.dart';

class ForgotPhoneScreen extends StatelessWidget {
  const ForgotPhoneScreen({super.key});

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
                  const Text("Số điện thoại"),
                  const SizedBox(height: 5),

                  const CustomTextField(hint: "Nhập số điện thoại"),

                  const SizedBox(height: 30),

                  // 🔷 Button
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: CustomButton(
                        text: "GỬI YÊU CẦU",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OtpScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // 🔷 Cách khác (quay lại chọn phương thức)
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
