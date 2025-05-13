class Post {
  final String author;
  final String role;
  final String timeAgo;
  final String content;
  final String imageUrl;
  final int stars;
  final int comments;

  const Post({
    required this.author,
    required this.role,
    required this.timeAgo,
    required this.content,
    required this.imageUrl,
    required this.stars,
    required this.comments,
  });
}