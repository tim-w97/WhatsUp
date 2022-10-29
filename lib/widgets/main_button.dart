import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MainButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.white,
      padding: const EdgeInsets.all(20),
      color: const Color(0xFFDBE200),
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: SizedBox(
        width: 100,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.brown),
        ),
      ),
    );
  }
}
