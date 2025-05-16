import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        radius: 30,
      ),
      title: const Text('Akhilesh Yadav',
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Founder at Google'),
          Row(
            children: [
              Text('Id'),
              Icon(Icons.edit, size: 16),
            ],
          ),
        ],
      ),
      trailing: IconButton(icon: Icon(Icons.person_add_alt), onPressed: () {}),
    );
  }
}
