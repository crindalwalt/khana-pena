import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khana_pena/firebase_options.dart';
import 'package:khana_pena/providers/auth_provider.dart';
import 'package:khana_pena/providers/theme_provider.dart';
import 'package:khana_pena/views/pages/auth/login.dart';
import 'package:khana_pena/views/pages/auth/register.dart';
import 'package:khana_pena/views/pages/auth/verify_email.dart';
import 'package:khana_pena/views/pages/home_page.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(     
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: RootApp(),
    ),
  );
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromARGB(255, 212, 212, 212),
        appBarTheme: AppBarTheme(backgroundColor: Colors.orange),
        colorScheme: ColorScheme.light(
          primary: Color(0xFFFF7043),
          secondary: Color(0xFFFFA726),
          surface: Color(0xFFFFFFFF),
          onPrimary: Colors.white,
          onSurface: Color(0xFF212121),
          error: Color(0xFFE53935),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: themeProvider.themeMode,
      home: LoginScreen(),
    );
  }
}
