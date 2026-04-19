import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';

class AuthService {
  static const String fileName = "users.json";
  static String? currentUser;

  // 🔥 Lấy file path
  static Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File("${dir.path}/$fileName");
  }

  // 🔥 Đọc file JSON
  static Future<List<User>> getUsers() async {
    try {
      final file = await _getFile();

      if (!await file.exists()) {
        return [];
      }

      String content = await file.readAsString();

      if (content.isEmpty) return [];

      List data = jsonDecode(content);
      return data.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  // 🔥 Ghi file JSON
  static Future<void> saveUsers(List<User> users) async {
    final file = await _getFile();

    List data = users.map((e) => e.toJson()).toList();

    await file.writeAsString(jsonEncode(data));
  }

  // 🔥 Đăng ký
  static Future<bool> register(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    List<User> users = await getUsers();

    for (var u in users) {
      if (u.username == username) return false;
    }

    users.add(
      User(username: username, password: password, email: email, phone: phone),
    );

    await saveUsers(users);
    return true;
  }

  // 🔥 Đăng nhập
  static Future<bool> login(String username, String password) async {
    List<User> users = await getUsers();

    for (var u in users) {
      if (u.username == username && u.password == password) {
        currentUser = username; // 🔥 lưu user hiện tại
        return true;
      }
    }
    return false;
  }

  // 🔥 Đổi mật khẩu
  static Future<bool> updatePassword(
    String username,
    String newPassword,
  ) async {
    List<User> users = await getUsers();

    for (var u in users) {
      if (u.username == username) {
        u.password = newPassword;
        await saveUsers(users);
        return true;
      }
    }

    return false;
  }
}
