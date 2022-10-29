import 'package:flutter/material.dart';
import 'package:whats_up/screens/home_screen.dart';
import 'package:whats_up/screens/login_screen.dart';
import 'package:whats_up/screens/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: {
        "/": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/registration": (context) => const RegistrationScreen(),
      },
    );
  }
}
