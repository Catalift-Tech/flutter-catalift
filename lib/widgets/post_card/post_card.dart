import 'package:cataliftapp/models/post_model.dart';
import 'package:cataliftapp/widgets/post_card/post_actions.dart';
import 'package:cataliftapp/widgets/post_card/post_content.dart';
import 'package:cataliftapp/widgets/post_card/post_header.dart';
import 'package:cataliftapp/widgets/post_card/post_stats.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final Function(String postId) onStarToggle;
  final Function(String postId) onComment;
  final Function(String postId) onShare;

  const PostCard({
    super.key,
    required this.post,
    required this.onStarToggle,
    required this.onComment,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(post: post),
          PostContent(post: post),
          const SizedBox(height: 8),
          PostStats(post: post),
          const SizedBox(height: 4),
          PostActions(
            post: post,
            onStarToggle: onStarToggle,
            onComment: onComment,
            onShare: onShare,
          ),
        ],
      ),
    );
  }
}
