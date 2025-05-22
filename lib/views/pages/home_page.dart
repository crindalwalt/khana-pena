import 'package:flutter/material.dart';
import 'package:khana_pena/models/category.dart';
import 'package:khana_pena/models/food.dart';
import 'package:khana_pena/providers/recipe_provider.dart';
import 'package:khana_pena/views/components/category_box.dart';
import 'package:khana_pena/views/components/featured_meal_card.dart';
import 'package:khana_pena/views/components/header.dart';
import 'package:khana_pena/views/components/meal_grid_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCarouselIndex = 0;
  int _selectedBottomNavIndex = 0;

  final List<String> _filters = [
    'Vegetarian',
    'Non-vegetarian',
    'Vegan',
    'Gluten-free',
    'Low-carb',
    'High-protein',
  ];

  List<Category> categoriesList = foodCategories;
  @override
  Widget build(BuildContext context) {
    // start provider here
    final recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              const SizedBox(height: 20),
              _buildMealCarousel(foods),
              const SizedBox(height: 24),
              _buildCategoriesSection(categoriesList),
              const SizedBox(height: 24),
              _buildFiltersSection(),
              const SizedBox(height: 24),
              _buildMealGrid(provider: recipeProvider),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildMealCarousel(List<Food> foodList) {
    return Column(
      children: [
        SizedBox(
          height: 280,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentCarouselIndex = index % foodList.length;
              });
            },
            itemCount: foodList.length,
            itemBuilder: (context, index) {
              final Food meal = foodList[index];
              return FeaturedMealCard(meal: meal);
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            foodList.length,
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

  Widget _buildCategoriesSection(List<Category> categories) {
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
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryBox(category: category);
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

  Widget _buildMealGrid({required RecipeProvider provider}) {
    return FutureBuilder(
      future: provider.fetchAllRecipes(),
      builder: (context, snapshot) {
        // if data is in waiting mode
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        // if data is available or null/errors
        if (snapshot.hasError || !snapshot.hasData) {
          return Center(child: Icon(Icons.warning));
        }

        // if data is present and well then print it

        final mealsData = snapshot.data;
        return GridView.builder(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: mealsData!.docs.length,
          itemBuilder: (context, index) {
            // Food meal = foods[index];
            final mealData = mealsData.docs[index];
            // meals data
            print("==============Meal Data");
            print(mealData);
            return Card(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.network(mealData["images"][0]),
                  ),
                  Text(mealData["name"]),
                  Text("description"),
                ],
              ),
            );
            // return MealCard(meal: meal);
          },
        );
      },
    );
  }
}
