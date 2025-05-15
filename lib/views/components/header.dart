import 'package:flutter/material.dart';
import 'package:khana_pena/providers/auth_provider.dart';
import 'package:khana_pena/providers/theme_provider.dart';
import 'package:khana_pena/views/pages/auth/register.dart';
import 'package:khana_pena/views/pages/favourite_meal_screen.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  bool isDarkMode = false;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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

                child: Switch(
                  value:
                      themeProvider.themeMode == ThemeMode.dark ? true : false,
                  onChanged: (value) {
                    
                      themeProvider.toggleDarkMode(value);
                    
                    print(themeProvider.themeMode);
                    print("mode is ${widget.isDarkMode}");
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  // ! auth signout functionality
                  final authProvider = Provider.of<AuthProvider>(context,listen: false);
                  authProvider.logoutUser();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Logout successfully"))
                  );

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
