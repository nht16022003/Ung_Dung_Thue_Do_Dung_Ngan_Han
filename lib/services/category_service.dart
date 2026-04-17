import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryService {
  static List<Category> getCategories() {
    return [
      Category(name: "Gia dụng", icon: Icons.kitchen),
      Category(name: "Điện tử", icon: Icons.devices),
      Category(name: "Du lịch", icon: Icons.travel_explore),
      Category(name: "Sự kiện", icon: Icons.celebration),
      Category(name: "Thời trang", icon: Icons.checkroom),
    ];
  }
}
