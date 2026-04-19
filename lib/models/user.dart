class User {
  String username;
  String password;
  String email;
  String phone;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
  });

  // 🔥 convert object -> json
  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "email": email,
    "phone": phone,
  };

  // 🔥 json -> object (có xử lý dữ liệu cũ)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json["username"] ?? "",
      password: json["password"] ?? "",
      email: json["email"] ?? "", // 🔥 tránh crash nếu chưa có
      phone: json["phone"] ?? "", // 🔥 tránh crash nếu chưa có
    );
  }
}
