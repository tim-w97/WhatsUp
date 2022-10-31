import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isFromMe;

  final _borderRadius = const Radius.circular(20);

  const MessageBubble({
    Key? key,
    required this.sender,
    required this.text,
    required this.isFromMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:
              isFromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(sender),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.only(
                topLeft: isFromMe ? _borderRadius : Radius.zero,
                topRight: isFromMe ? Radius.zero : _borderRadius,
                bottomLeft: _borderRadius,
                bottomRight: _borderRadius,
              ),
              color: isFromMe ? const Color(0xFFDBE200) : Colors.white,
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
