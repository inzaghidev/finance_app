import 'package:finance_app/screens/dashboard.dart';
import 'package:finance_app/services/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  var db = Db();
  createUser(data, context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      await db.addUser(data, context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text('Sign up Failed'), content: Text(e.toString()));
          });
    }
  }

  login(data, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text('Login Error'), content: Text(e.toString()));
          });
    }
  }
}

// on FirebaseAuthException catch (e) {
//      if (e.code == 'weak-password') {
//        print('The password provided is too weak.');
//      } else if (e.code == 'email-already-in-use') {
//        print('The account already exists for that email.');
//      }
//}