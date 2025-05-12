import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final String query;
  const SearchResultsPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> engineeringMentors = List.generate(
      10,
      (index) => {
        'name': 'Eng. Mentor ${index + 1}',
        'specialty': 'Software Engineering',
        'experience': '${index + 3} years experience',
      },
    );

    final filteredMentors = engineeringMentors
        .where((mentor) =>
            mentor['name']!.toLowerCase().contains(query.toLowerCase()) ||
            mentor['specialty']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search: "$query"'),
      ),
      body: filteredMentors.isEmpty
          ? Center(
              child: Text(
                'No engineering mentors found for "$query".',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              itemCount: filteredMentors.length,
              itemBuilder: (context, index) {
                final mentor = filteredMentors[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.engineering_outlined),
                  ),
                  title: Text(mentor['name']!),
                  subtitle:
                      Text('${mentor['specialty']}\n${mentor['experience']}'),
                  isThreeLine: true,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped on ${mentor['name']}')),
                    );
                  },
                );
              },
            ),
    );
  }
}
