import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseProvider with ChangeNotifier {
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final messageController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  bool isLoading = false;

  Stream<QuerySnapshot> get messageSnapshots {
    return _firestore.collection("messages").snapshots();
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> sendMessage() async {
    final user = _auth.currentUser;

    if (user == null) return;

    await _firestore.collection("messages").add({
      "sender": user.email,
      "text": messageController.text,
    });

    messageController.clear();
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
