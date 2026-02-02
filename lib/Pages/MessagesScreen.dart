import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Messages Screen",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
