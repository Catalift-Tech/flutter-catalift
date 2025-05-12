
import 'package:cataliftapp/models/user_model.dart';

class PostModel {
  final String id;
  final UserModel user;
  final String content;
  final String? imageUrl;
  final DateTime timestamp;
  final bool isEdited;
  int starCount;
  int commentCount;
  bool isStarredByCurrentUser; // To manage the star state locally

  PostModel({
    required this.id,
    required this.user,
    required this.content,
    this.imageUrl,
    required this.timestamp,
    this.isEdited = false,
    this.starCount = 0,
    this.commentCount = 0,
    this.isStarredByCurrentUser = false,
  });
}