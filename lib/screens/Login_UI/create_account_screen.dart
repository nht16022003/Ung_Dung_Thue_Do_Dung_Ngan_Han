import 'package:flutter/material.dart';
import '../../widgets/Login/custom_button.dart';
import '../../widgets/Login/custom_textfield.dart';
import 'create_sucess.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔷 Header
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.teal,
              ),

              const SizedBox(height: 20),

              // 🔷 Title (font viết tay)
              const Text(
                "Đăng ký tài khoản",
                style: TextStyle(fontFamily: "PlaywriteNZGuides", fontSize: 24),
              ),

              const SizedBox(height: 25),

              // 🔷 Form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Tên đăng nhập:"),
                    const SizedBox(height: 5),
                    const CustomTextField(hint: "Nhập username"),

                    const SizedBox(height: 15),

                    const Text("Email:"),
                    const SizedBox(height: 5),
                    const CustomTextField(hint: "Nhập email"),

                    const SizedBox(height: 15),

                    const Text("SDT:"),
                    const SizedBox(height: 5),
                    const CustomTextField(hint: "Nhập số điện thoại"),

                    const SizedBox(height: 15),

                    const Text("Mật khẩu:"),
                    const SizedBox(height: 5),
                    const CustomTextField(
                      hint: "Nhập mật khẩu",
                      isPassword: true,
                    ),

                    const SizedBox(height: 15),

                    const Text("Xác nhận mật khẩu:"),
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
                          text: "ĐĂNG KÝ",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SuccessScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 🔷 Thanh dưới
              Container(
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
      ),
    );
  }
}
