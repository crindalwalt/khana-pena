import 'package:flutter/material.dart';
import 'package:khana_pena/models/food.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCarouselIndex = 0;
  int _selectedBottomNavIndex = 0;
  final Food chickenBiryani = Food(
    name: "Chicken Biryani",
    description: "Fresh seasonal vegetables with al dente pasta",
    imageUrl:
        "https://images.pexels.com/photos/17649369/pexels-photo-17649369/free-photo-of-meat-with-rice.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    timeToPrepare: "30 mins",
    difficulty: "medium",
    rating: "4.5",
    category: "Pakistani Cousine",
  );

  final List<Food> _foodItemList = [
    Food(
      name: "Chicken Biryani",
      description:
          "Fragrant rice dish with marinated chicken and aromatic spices",
      imageUrl:
          "https://images.pexels.com/photos/17649369/pexels-photo-17649369/free-photo-of-meat-with-rice.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      timeToPrepare: "60 mins",
      difficulty: "Medium",
      rating: "4.8",
      category: "Pakistani Cuisine",
    ),
    Food(
      name: "Beef Nihari",
      description:
          "Slow-cooked beef stew with rich spices, traditionally served for breakfast",
      imageUrl:
          "https://images.pexels.com/photos/2313686/pexels-photo-2313686.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      timeToPrepare: "180 mins",
      difficulty: "Hard",
      rating: "4.7",
      category: "Pakistani Cuisine",
    ),
    Food(
      name: "Seekh Kebab",
      description: "Grilled minced meat skewers flavored with herbs and spices",
      imageUrl:
          "https://images.pexels.com/photos/2233729/pexels-photo-2233729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      timeToPrepare: "40 mins",
      difficulty: "Medium",
      rating: "4.5",
      category: "Pakistani Cuisine",
    ),
    Food(
      name: "Chapli Kebab",
      description: "Spicy minced meat patties famous in Peshawar region",
      imageUrl:
          "https://images.pexels.com/photos/1251198/pexels-photo-1251198.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      timeToPrepare: "30 mins",
      difficulty: "Medium",
      rating: "4.6",
      category: "Pakistani Cuisine",
    ),
    Food(
      name: "Haleem",
      description:
          "Slow-cooked stew of wheat, lentils, and meat, blended into thick paste",
      imageUrl:
          "https://images.pexels.com/photos/7625056/pexels-photo-7625056.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      timeToPrepare: "150 mins",
      difficulty: "Hard",
      rating: "4.7",
      category: "Pakistani Cuisine",
    ),
    Food(
      name: "Karahi Gosht",
      description: "Spicy meat dish cooked in a wok-like utensil called karahi",
      imageUrl:
          "https://images.pexels.com/photos/8969237/pexels-photo-8969237.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      timeToPrepare: "45 mins",
      difficulty: "Medium",
      rating: "4.6",
      category: "Pakistani Cuisine",
    ),
    Food(
      name: "Aloo Keema",
      description: "Minced meat cooked with potatoes and traditional spices",
      imageUrl:
          "https://images.pexels.com/photos/7211169/pexels-photo-7211169.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      timeToPrepare: "40 mins",
      difficulty: "Easy",
      rating: "4.3",
      category: "Pakistani Cuisine",
    ),
    Food(
      name: "Chana Chaat",
      description: "Tangy chickpea salad with vegetables and tamarind sauce",
      imageUrl:
          "https://images.pexels.com/photos/1640773/pexels-photo-1640773.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      timeToPrepare: "20 mins",
      difficulty: "Easy",
      rating: "4.2",
      category: "Pakistani Cuisine",
    ),
    Food(
      name: "Paya Soup",
      description: "Traditional soup made from slow-cooking trotters in spices",
      imageUrl:
          "https://images.pexels.com/photos/539451/pexels-photo-539451.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      timeToPrepare: "240 mins",
      difficulty: "Hard",
      rating: "4.4",
      category: "Pakistani Cuisine",
    ),
    Food(
      name: "Sheermal",
      description:
          "Saffron-flavored traditional flatbread, often served with kebabs",
      imageUrl:
          "https://images.pexels.com/photos/1586942/pexels-photo-1586942.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      timeToPrepare: "35 mins",
      difficulty: "Medium",
      rating: "4.1",
      category: "Pakistani Cuisine",
    ),
  ];
  List _featuredMeals = [
    {
      'name': 'Vegetable Pasta Primavera',
      'image': 'assets/images/pasta.jpg',
      'description': 'Fresh seasonal vegetables with al dente pasta',
      'time': '30 min',
      'difficulty': 'Easy',
      'rating': 4.5,
    },
    {
      'name': 'Butter Chicken',
      'image': 'assets/images/butter_chicken.jpg',
      'description': 'Creamy tomato sauce with tender chicken',
      'time': '50 min',
      'difficulty': 'Medium',
      'rating': 4.9,
    },
  ];

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Breakfast', 'icon': Icons.free_breakfast, 'color': Colors.amber},
    {'name': 'Lunch', 'icon': Icons.lunch_dining, 'color': Colors.orange},
    {'name': 'Dinner', 'icon': Icons.dinner_dining, 'color': Colors.deepOrange},
    {'name': 'Snacks', 'icon': Icons.cookie, 'color': Colors.brown},
    {'name': 'Desserts', 'icon': Icons.icecream, 'color': Colors.pink},
  ];

  final List<String> _filters = [
    'Vegetarian',
    'Non-vegetarian',
    'Vegan',
    'Gluten-free',
    'Low-carb',
    'High-protein',
  ];

  final List<Map<String, dynamic>> _trendingRecipes = [
    {
      'name': 'Masala Dosa',
      'image': 'assets/images/dosa.jpg',
      'chef': 'Chef Ranveer Brar',
      'time': '20 min',
      'likes': 2453,
    },
    {
      'name': 'Palak Paneer',
      'image': 'assets/images/palak_paneer.jpg',
      'chef': 'Chef Sanjeev Kapoor',
      'time': '35 min',
      'likes': 1892,
    },
    {
      'name': 'Chole Bhature',
      'image': 'assets/images/chole.jpg',
      'chef': 'Chef Kunal Kapur',
      'time': '40 min',
      'likes': 1756,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _showFeaturedFoodCarousel(),
              const SizedBox(height: 24),
              _buildCategoriesSection(),
              const SizedBox(height: 24),
              _buildFiltersSection(),
              const SizedBox(height: 24),
              _buildTrendingSection(),
              const SizedBox(height: 24),
              _buildMealPlanSection(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.restaurant_menu, color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Text(
                'Khana Pena',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.person);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _showFeaturedFoodCarousel(){
      return Container(
        width: double.infinity,
        height: 300,
        color: Colors.red,
        child: ListView.builder(
          itemCount: _foodItemList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            Food meal = _foodItemList[index];
            return Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(meal.imageUrl), fit: BoxFit.cover),
              ),

            );
          },
        ),
      );
  }


  Widget _buildMealCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 280,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentCarouselIndex = index % _featuredMeals.length;
              });
            },
            itemBuilder: (context, index) {
              final meal = _featuredMeals[index % _featuredMeals.length];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
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
                      child: Image.asset(
                        meal['image'],
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
                            meal['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            meal['description'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                meal['time'],
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 12),
                              const Icon(Icons.trending_up, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                meal['difficulty'],
                                style: const TextStyle(fontSize: 12),
                              ),
                              const Spacer(),
                              ...List.generate(
                                5,
                                (index) => Icon(
                                  index < (meal['rating'] as double).floor()
                                      ? Icons.star
                                      : index < meal['rating']
                                      ? Icons.star_half
                                      : Icons.star_border,
                                  color: Colors.amber,
                                  size: 16,
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
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _featuredMeals.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                color:
                    _currentCarouselIndex == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text('See All')),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              return Container(
                width: 88,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: category['color'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: category['color'].withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: category['color'].withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        category['icon'],
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category['name'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFiltersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Quick Filters',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 40,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: _filters.length,
            itemBuilder: (context, index) {
              final filter = _filters[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: FilterChip(
                  label: Text(filter),
                  onSelected: (selected) {},
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                  ),
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Trending Now',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text('View More')),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _trendingRecipes.length,
          itemBuilder: (context, index) {
            final recipe = _trendingRecipes[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      recipe['image'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.image),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'By ${recipe['chef']}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              recipe['time'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.favorite,
                              size: 14,
                              color: Colors.red.shade400,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${recipe['likes']}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
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
          },
        ),
      ],
    );
  }

  Widget _buildMealPlanSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Your Meal Plan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'May 15, 2023',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildMealPlanItem(
                'Breakfast',
                'Avocado Toast with Poached Eggs',
              ),
              const SizedBox(height: 8),
              _buildMealPlanItem('Lunch', 'Quinoa Salad with Grilled Chicken'),
              const SizedBox(height: 8),
              _buildMealPlanItem('Dinner', 'Tap to add a meal'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMealPlanItem(String mealType, String mealName) {
    bool isAdded = mealName != 'Tap to add a meal';

    return Row(
      children: [
        Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            mealType,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            mealName,
            style: TextStyle(
              color: isAdded ? Colors.black : Colors.grey,
              fontStyle: isAdded ? FontStyle.normal : FontStyle.italic,
            ),
          ),
        ),
        Icon(isAdded ? Icons.edit : Icons.add, size: 18, color: Colors.grey),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedBottomNavIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Meal Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
