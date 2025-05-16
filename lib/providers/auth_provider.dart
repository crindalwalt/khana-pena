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
  Future<UserCredential> loginUser ({
    required String email,
    required String password
  }) async{

    //! request to firebase auth for login
    final UserCredential loggingIn = await _auth.signInWithEmailAndPassword(email: email, password: password);
    print("our system is trying to login");

    return loggingIn;

  }


  void logoutUser  () async{
    await _auth.signOut();
  }
}
