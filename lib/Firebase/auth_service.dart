import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  // SignUp method for Player
  Future<void> playerSignUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      String message='';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
        // throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
        // throw Exception('The account already exists for that email.');
      } else {
        message = 'An unknown error occurred. Please try again later.';
        // throw Exception('An unknown error occurred. Please try again later.');
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  // SignIn method for Player
  Future<void> playerSignIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      String message='';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
        // throw Exception('The password provided is too weak.');
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
        
        // throw Exception('The account already exists for that email.');
      } else {
        message = 'An unknown error occurred. Please try again later.';
        // throw Exception('An unknown error occurred. Please try again later.');
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  // SignOut method for Player
  Future<void> playerSignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await Future.delayed(const Duration(seconds: 1));

    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error signing out. Please try again.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}