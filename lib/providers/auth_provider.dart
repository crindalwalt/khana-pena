import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // properties (variables) and methods (function)

  // initiate the firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    // how to implement registration


    // ! firebase auth query
    final UserCredential registering = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

  return registering;


  }



  void logoutUser  () async{
    await _auth.signOut();
  }
}
