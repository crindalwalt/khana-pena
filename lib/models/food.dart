class Food {
  // properties
  String name;
  String description;
  String imageUrl;
  String timeToPrepare;
  String difficulty;
  String rating;
  String category;

  // constructor
  Food({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.timeToPrepare,
    required this.difficulty,
    required this.rating,
    required this.category,
  });
}

 final List<Food> foodItemList = [
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
          "Slow-cooked beef stew with rich spicest",
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
          "Slow-cooked stew of wheat, lentils, and meat",
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
 