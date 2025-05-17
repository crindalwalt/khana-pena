import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // properties (variables) and methods (function)

  // initiate the firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Future<UserCredential?> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    // how to implement registration
    try {
      // ! firebase auth query
      final UserCredential registering = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // TODO: update the user document with same id as firebase auth
      //! firestore collection addition
      final addUser = await _database.collection("users").add({
        "name": name,
        "email": email,
        "phone": phone,
        "email_verified": false,
      });

      return registering;
    } catch (error) {
      print(
        "Error occurs when trying to use firebase auth for login ${error.toString()}",
      );
    }
  }

  Future<UserCredential?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      //! request to firebase auth for login
      final UserCredential loggingIn = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("our system is trying to login");

      return loggingIn;
    } catch (e) {
      print(
        "Error occurs when trying to use firebase auth for login ${e.toString()}",
      );
    }
  }

  void verifyUserEmail(UserCredential userCradentials) async {
    
    await userCradentials.user!.sendEmailVerification();
  }

  void logoutUser() async {
    await _auth.signOut();
  }
}
