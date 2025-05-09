import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        backgroundColor: const Color(0xFF03045E), // Background color stays the same
        iconTheme: const IconThemeData(color: Colors.white), // Set back arrow color to white
      ),
      body: ListView(
        children: [
          _buildNotificationTile(
            icon: Icons.message,
            title: "New Message",
            subtitle: "You have a new message from your friend.",
            time: "5 minutes ago",
          ),
          _buildNotificationTile(
            icon: Icons.assignment,
            title: "Assignment Due",
            subtitle: "Your assignment is due in 2 days.",
            time: "1 hour ago",
          ),
          _buildNotificationTile(
            icon: Icons.event,
            title: "Event Reminder",
            subtitle: "Don't forget the event tomorrow at 5 PM.",
            time: "2 hours ago",
          ),
          _buildNotificationTile(
            icon: Icons.local_offer,
            title: "Special Offer",
            subtitle: "Exclusive discount on your next purchase.",
            time: "5 hours ago",
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
