import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'change_password_screen.dart';
import '../../screens/Login_UI/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      appBar: AppBar(
        title: const Text("Thông tin cá nhân"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Avatar
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.teal,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            // Tên và Email
            const Text(
              "Hoài Sơn",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "son.it@example.com",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Các tùy chọn
            _buildProfileOption(
              icon: Icons.edit,
              title: "Chỉnh sửa thông tin",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              ),
            ),
            _buildProfileOption(
              icon: Icons.lock_outline,
              title: "Đổi mật khẩu",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen(),
                ),
              ),
            ),
            _buildProfileOption(
              icon: Icons.logout,
              title: "Đăng xuất",
              textColor: Colors.red,
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false, // xóa toàn bộ stack
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = Colors.black,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          title,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
