class UserModel {
  final String name;
  final String? avatarUrl; // Can be null if using initials
  final String title;

  UserModel({
    required this.name,
    this.avatarUrl,
    required this.title,
  });
}