import 'package:flutter/material.dart';
import 'package:whats_up/widgets/main_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "spongi",
                child: Image.asset(
                  "images/app_icon.png",
                  width: 200,
                ),
              ),
              const SizedBox(height: 20),
              MainButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/registration");
                  },
                  text: "Register"),
              const SizedBox(height: 20),
              MainButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  text: "Log in"),
            ],
          ),
        ),
      ),
    );
  }
}
