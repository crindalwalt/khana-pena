import 'package:flutter/material.dart';

class Category {
  String id;
  String name;
  Color color;
  IconData icon;

  Category({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });

}

List<Category> foodCategories = [
  Category(
    id: '1',
    name: 'Fruits',
    color: Colors.red,
    icon: Icons.apple,
  ),
  Category(
    id: '2',
    name: 'Vegetables',
    color: Colors.green,
    icon: Icons.eco,
  ),
  Category(
    id: '3',
    name: 'Dairy',
    color: Colors.blue,
    icon: Icons.local_drink,
  ),
  Category(
    id: '4',
    name: 'Meat',
    color: Colors.brown,
    icon: Icons.lunch_dining,
  ),
  Category(
    id: '5',
    name: 'Seafood',
    color: Colors.teal,
    icon: Icons.set_meal,
  ),
  Category(
    id: '6',
    name: 'Bakery',
    color: Colors.orange,
    icon: Icons.bakery_dining,
  ),
  Category(
    id: '7',
    name: 'Beverages',
    color: Colors.purple,
    icon: Icons.local_cafe,
  ),
  Category(
    id: '8',
    name: 'Snacks',
    color: Colors.pink,
    icon: Icons.fastfood,
  ),
  Category(
    id: '9',
    name: 'Frozen Food',
    color: Colors.cyan,
    icon: Icons.ac_unit,
  ),
  Category(
    id: '10',
    name: 'Spices',
    color: Colors.amber,
    icon: Icons.spa,
  ),
];