import 'package:cataliftapp/pages/search_results_page.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
              ),
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchResultsPage(query: query),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add Post Clicked')));
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.inputDecorationTheme.fillColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.brightness == Brightness.light
                      ? Colors.grey.shade300
                      : Colors.grey.shade700,
                  width: 0.5,
                ),
              ),
              child: Icon(
                Icons.add,
                color: theme.iconTheme.color,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
