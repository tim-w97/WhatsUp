import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_up/firebase_options.dart';
import 'package:whats_up/providers/firebase_provider.dart';
import 'package:whats_up/screens/chat_screen.dart';
import 'package:whats_up/screens/home_screen.dart';
import 'package:whats_up/screens/login_screen.dart';
import 'package:whats_up/screens/registration_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FirebaseProvider(),
      child: const WhatsUpApp(),
    ),
  );

  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class WhatsUpApp extends StatelessWidget {
  const WhatsUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: {
        "/": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/registration": (context) => const RegistrationScreen(),
        "/chat": (context) => const ChatScreen(),
      },
    );
  }
}
