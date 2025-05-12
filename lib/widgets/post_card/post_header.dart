import 'package:cataliftapp/models/post_model.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final PostModel post;

  const PostHeader({super.key, required this.post});

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey.shade300,
            child: post.user.avatarUrl == null
                ? Text(
                    post.user.name.isNotEmpty
                        ? post.user.name[0].toUpperCase()
                        : 'U',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface.withOpacity(0.7)),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.user.name,
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 2),
                Text(
                  post.user.title,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      _formatTimestamp(post.timestamp),
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
                    ),
                    if (post.isEdited)
                      Text(
                        ' • Edited',
                        style:
                            theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
                      ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.person_add_alt_1_outlined,
                color: theme.iconTheme.color),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Follow ${post.user.name}')));
            },
          ),
        ],
      ),
    );
  }
}
