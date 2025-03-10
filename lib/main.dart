import 'package:flutter/material.dart';
import 'package:khana_pena/views/pages/home_page.dart';
import 'package:khana_pena/views/pages/meal_detail.dart';

void main () {
    runApp( RootApp());
}


class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}