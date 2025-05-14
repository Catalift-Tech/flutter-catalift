import 'package:flutter/material.dart';

class MessagesContentScreen extends StatelessWidget {
  const MessagesContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Messages Content',
        style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
      ),
    );
  }
}
