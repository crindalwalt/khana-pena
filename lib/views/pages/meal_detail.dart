import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:khana_pena/models/food.dart';

class MealDetailPage extends StatelessWidget {
  final Food meal;
  MealDetailPage({required this.meal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
        centerTitle: false,

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! main image
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image(
                    image: NetworkImage(meal.images.first),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              //! secondary images
              Container(
                width: double.infinity,
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: meal.images.length,
                  itemBuilder: (context, index) {
                    String imageUrl = meal.images[index];
                    return Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 5),
              //! Title and description
              Text(
                meal.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(height: 5),
              Text(
                meal.description,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  StarRating(rating: meal.rating),
                  SizedBox(width: 5),
                  Text(meal.rating.toString()),
                ],
              ),
              const SizedBox(height: 5),

              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage("https://picsum.photos/200/200"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(meal.chef["name"]!),
                  ],
                ),
              ),
              const SizedBox(height: 5),

              //! specification section
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.trending_up,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(meal.difficulty),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.punch_clock,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(meal.timeToPrepare),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.flag,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(meal.countryOfOrigin),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.group,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(meal.servingSize.toString() + " person"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              //! Ingredients
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: const Text('See All')),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 5),

                      decoration: BoxDecoration(
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.food_bank),
                        title: Text(meal.ingredients[index]),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              //! Ingredients
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Steps',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: const Text('See All')),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: meal.steps.length,
                  itemBuilder: (context, index) {
                    int count = index + 1;
                    return Container(
                      margin: EdgeInsets.only(bottom: 5),

                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(child: Text(count.toString())),
                        title: Text(meal.steps[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: ,
      // drawer: ,
    );
  }
}
