import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_up/providers/firebase_provider.dart';
import 'package:whats_up/widgets/main_button.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseProvider = context.read<FirebaseProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: MainButton(
                  onPressed: () async {
                    await firebaseProvider.logout();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text("Chat is coming soon."),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Your message"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  MainButton(
                      onPressed: () {},
                      child: const Icon(
                        color: Colors.brown,
                        Icons.send,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
