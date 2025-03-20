
import 'package:flutter/material.dart';
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
                    image: NetworkImage(
                      meal.imageUrl,
                    ),
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://images.pexels.com/photos/7129446/pexels-photo-7129446.jpeg?auto=compress&cs=tinysrgb&w=1280&h=750&dpr=1",
                          ),
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
                    Text("Gorden Ramsey"),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              //! rating
              Row(
                children: List.generate(4, (context) {
                  return Icon(Icons.star, color: Colors.amber, size: 15);
                }),
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
                          Text("Easy"),
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
                          Text("20 Min"),
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
                          Text("Italy"),
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
                          Text("3 person"),
                        ],
                      ),
                    ),
                  ],
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
