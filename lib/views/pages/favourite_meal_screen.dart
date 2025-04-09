import 'package:flutter/material.dart';
import 'package:khana_pena/models/food.dart';
import 'package:khana_pena/views/components/featured_meal_card.dart';
import 'package:khana_pena/views/components/saved_meal_card.dart';
import 'package:khana_pena/views/pages/meal_detail.dart';

class FavouriteMealScreen extends StatefulWidget {
  const FavouriteMealScreen({super.key});

  @override
  State<FavouriteMealScreen> createState() => _FavouriteMealScreenState();
}

class _FavouriteMealScreenState extends State<FavouriteMealScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Food> list =
        foods.where((item) => item.isSaved == true).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Meals'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(child: Text(list.length.toString())),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final meal = list[index];
          // TODO: create this tile in amazing design
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    meal.images.first,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 180,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image, size: 50),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        meal.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            meal.timeToPrepare,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.trending_up, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            meal.difficulty,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 120,
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  meal.isSaved = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.favorite),
                                  const SizedBox(width: 3),
                                  Text("Unsave"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            width: 120,
                            child: OutlinedButton(
                              onPressed: () {
                                // navigate to the meal detail screen
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => MealDetailPage(meal: meal),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.visibility),
                                  const SizedBox(width: 3),
                                  Text("View"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
          ;
        },
      ),
    );
  }
}
