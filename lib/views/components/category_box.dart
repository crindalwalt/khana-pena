import 'package:flutter/material.dart';
import 'package:khana_pena/models/category.dart';

class CategoryBox extends StatelessWidget {
  Category category;
  CategoryBox({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: category.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: category.color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: category.color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(category.icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
