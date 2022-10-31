import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;

  const MessageBubble({Key? key, required this.sender, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(sender),
            Material(
              shape: const StadiumBorder(),
              color: const Color(0xFFDBE200),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.brown),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
