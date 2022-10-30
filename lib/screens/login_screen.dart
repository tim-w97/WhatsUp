import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_up/providers/firebase_provider.dart';
import 'package:whats_up/widgets/main_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseProvider = context.watch<FirebaseProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Hero(
                tag: "spongi",
                child: Image.asset(
                  "images/app_icon.png",
                  width: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                autocorrect: false,
                controller: firebaseProvider.emailAddressController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "Email Address"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                autocorrect: false,
                controller: firebaseProvider.passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: "Password"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MainButton(
              onPressed: () async {
                final user = await firebaseProvider.loginUser();
                Navigator.pushNamed(context, "/chat");
              },
              child: const Text(
                "Log in",
                style: TextStyle(color: Colors.brown),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (firebaseProvider.isLoading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
