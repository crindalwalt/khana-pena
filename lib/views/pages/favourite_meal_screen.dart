import 'package:flutter/material.dart';
import 'package:khana_pena/models/food.dart';

class FavouriteMealScreen extends StatefulWidget {
  const FavouriteMealScreen({super.key});

  @override
  State<FavouriteMealScreen> createState() => _FavouriteMealScreenState();
}

class _FavouriteMealScreenState extends State<FavouriteMealScreen> {
  final list = foods.where((food) => food.isSaved == true).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourite Meals')),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final foodItem = list[index];
          return ListTile(
            leading: CircleAvatar(child: Image.network(foodItem.images.first)),
            title: Text(foodItem.name),
          );
        },
      ),
    );
  }
}
