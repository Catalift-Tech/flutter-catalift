import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(color: Colors.white), // White text for the title
        ),
        backgroundColor: const Color(0xFF03045E), // AppBar color
        iconTheme: const IconThemeData(color: Colors.white), // White back arrow
      ),
      body: ListView(
        children: [
          _buildMessageTile(
            sender: "John Doe",
            message: "Hey! Are you coming to the event?",
            time: "5 minutes ago",
          ),
          _buildMessageTile(
            sender: "Jane Smith",
            message: "Don't forget to submit your assignment!",
            time: "1 hour ago",
          ),
          _buildMessageTile(
            sender: "Alice",
            message: "Can you send me the report by tomorrow?",
            time: "3 hours ago",
          ),
          _buildMessageTile(
            sender: "Bob",
            message: "Let's catch up over coffee soon!",
            time: "1 day ago",
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile({
    required String sender,
    required String message,
    required String time,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListTile(
        leading: const Icon(Icons.message, color: Colors.blue),
        title: Text(
          sender,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
        trailing: Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        onTap: () {
          // Handle message tap, for example, navigate to a detailed message view
        },
      ),
    );
  }
}
