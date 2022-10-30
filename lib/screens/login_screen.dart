import 'package:flutter/material.dart';
import 'package:whats_up/widgets/main_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: "Email Address"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MainButton(onPressed: () {}, text: "Log in"),
          ],
        ),
      ),
    );
  }
}
