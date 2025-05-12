import 'package:cataliftapp/models/post_model.dart';
import 'package:flutter/material.dart';

class PostStats extends StatelessWidget {
  final PostModel post;

  const PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${post.starCount} Stars',
            style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSurface.withOpacity(0.7)),
          ),
          Text(
            '${post.commentCount} comments',
            style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSurface.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}
