import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_up/providers/firebase_provider.dart';
import 'package:whats_up/widgets/main_button.dart';
import 'package:whats_up/widgets/message_bubble.dart';

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
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firebaseProvider.messageSnapshots,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  final documents = snapshot.data!.docs;

                  documents.sort((firstDocument, secondDocument) {
                    Timestamp firstTimstamp = firstDocument["timestamp"];
                    return firstTimstamp.compareTo(secondDocument["timestamp"]);
                  });

                  return ListView(
                    reverse: true,
                    children: documents.reversed.map((document) {
                      final sender = document["sender"];
                      final text = document["text"];

                      return MessageBubble(
                        isFromMe:
                            firebaseProvider.currentUser.user?.email == sender,
                        sender: sender,
                        text: text,
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: firebaseProvider.messageController,
                      decoration:
                          const InputDecoration(hintText: "Your message"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  MainButton(
                      onPressed: () {
                        firebaseProvider.sendMessage();
                      },
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
