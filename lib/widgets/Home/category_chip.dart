import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String name;
  final bool isSelected;

  const CategoryChip({required this.name, this.isSelected = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.teal : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        name,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
