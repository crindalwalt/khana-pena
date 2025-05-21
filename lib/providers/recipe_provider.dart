import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecipeProvider extends ChangeNotifier {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  // * recive data from firestore server
  Future<QuerySnapshot?> fetchAllRecipes() async {
    try {
      // code
      final QuerySnapshot data = await _database.collection("recipies").get();
      if (data != null) {
        return data;
      }
    } catch (error) {
      print(
        "An error occured, during firestore data fetching , ${error.toString()}",
      );
      return null;
    }
  }
}
