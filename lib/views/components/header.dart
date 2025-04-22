import 'package:flutter/material.dart';
import 'package:khana_pena/views/pages/favourite_meal_screen.dart';

class Header extends StatefulWidget {
  bool isDarkMode = true;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  color: Theme.of(context).colorScheme.primary,
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
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FavouriteMealScreen(),
                    ),
                  );
                },
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Switch(
                  value: widget.isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      widget.isDarkMode = !widget.isDarkMode;
                    });
                    print("mode is ${widget.isDarkMode}");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
