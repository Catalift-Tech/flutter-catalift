import 'package:cataliftapp/models/post_model.dart';
import 'package:cataliftapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PostActions extends StatefulWidget {
  final PostModel post;
  final Function(String postId) onStarToggle;
  final Function(String postId) onComment;
  final Function(String postId) onShare;

  const PostActions({
    super.key,
    required this.post,
    required this.onStarToggle,
    required this.onComment,
    required this.onShare,
  });

  @override
  State<PostActions> createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.iconTheme.color?.withOpacity(0.8);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildActionButton(
            context: context,
            icon: widget.post.isStarredByCurrentUser
                ? Icons.star
                : Icons.star_border_outlined,
            label: 'Star',
            color: widget.post.isStarredByCurrentUser
                ? AppColors.starColor
                : iconColor,
            onPressed: () {
              widget.onStarToggle(widget.post.id);
            },
          ),
          _buildActionButton(
            context: context,
            icon: Icons.chat_bubble_outline,
            label: 'Comment',
            color: iconColor,
            onPressed: () {
              widget.onComment(widget.post.id);
            },
          ),
          _buildActionButton(
            context: context,
            icon: Icons.send_outlined,
            label: 'Share',
            color: iconColor,
            onPressed: () {
              widget.onShare(widget.post.id);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    Color? color,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: color ?? Theme.of(context).iconTheme.color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      icon: Icon(icon, size: 22, color: color),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
