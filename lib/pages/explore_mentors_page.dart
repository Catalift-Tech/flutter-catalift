import 'package:flutter/material.dart';

class ExploreMentorsPage extends StatelessWidget {
  const ExploreMentorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Mentors'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('M${index + 1}'),
            ),
            title: Text('Mentor Name ${index + 1}'),
            subtitle: const Text('Expert in Flutter Development'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('View Profile'),
            ),
          );
        },
      ),
    );
  }
}
