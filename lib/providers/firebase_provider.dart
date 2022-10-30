import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseProvider with ChangeNotifier {
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool isLoading = false;

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<UserCredential> registerUser() async {
    isLoading = true;
    notifyListeners();

    final user = await _auth.createUserWithEmailAndPassword(
      email: emailAddressController.text,
      password: passwordController.text,
    );

    emailAddressController.clear();
    passwordController.clear();

    isLoading = false;
    notifyListeners();
    return user;
  }

  Future<UserCredential> loginUser() async {
    isLoading = true;
    notifyListeners();

    final user = await _auth.signInWithEmailAndPassword(
      email: emailAddressController.text,
      password: passwordController.text,
    );

    emailAddressController.clear();
    passwordController.clear();

    isLoading = false;
    notifyListeners();
    return user;
  }
}
