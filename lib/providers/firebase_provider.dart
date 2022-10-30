import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseProvider {
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  Future<void> registerUser() async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailAddressController.text,
        password: passwordController.text,
      );
    } catch (exception) {
      print("Error while creating the user.");
      print(exception);
    }
  }
}
