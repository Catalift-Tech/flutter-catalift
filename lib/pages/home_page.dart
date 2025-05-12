import 'package:cataliftapp/models/post_model.dart';
import 'package:cataliftapp/models/user_model.dart';
import 'package:cataliftapp/pages/courses_page.dart';
import 'package:cataliftapp/pages/explore_mentors_page.dart';
import 'package:cataliftapp/widgets/custom_bottom_nav_bar.dart';
import 'package:cataliftapp/widgets/home_app_bar.dart';
import 'package:cataliftapp/widgets/post_card/post_card.dart';
import 'package:cataliftapp/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late List<PostModel> _posts;

  @override
  void initState() {
    super.initState();
    _posts = _getDummyPosts();
  }

  List<PostModel> _getDummyPosts() {
    return [
      PostModel(
        id: '1',
        user: UserModel(
          name: 'Akhilesh Yadav',
          title: 'Founder at Google',
        ),
        content:
            'The Briggs-Rauscher Reaction: A Mesmerizing Chemical Dance 🚀\n\nThis captivating process uses hydrogen peroxide, potassium iodate, malonic acid, manganese sulfate, and starch. Iodine and iodate ions interact to form compounds that shift the solution\'s color, while starch amplifies the blue color before it breaks down and starts again. 💡',
        imageUrl: 'assets/images/post_image.jpg',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        isEdited: true,
        starCount: 1546,
        commentCount: 80,
        isStarredByCurrentUser: false,
      ),
      PostModel(
        id: '2',
        user: UserModel(name: 'Jane Doe', title: 'Lead Designer @ Meta'),
        content:
            'Excited to share my latest UI/UX project focusing on accessibility. Designing for everyone is key! #uidesign #accessibility #ux',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        starCount: 782,
        commentCount: 45,
        isStarredByCurrentUser: true,
      ),
      PostModel(
        id: '3',
        user: UserModel(name: 'Tech Innovations', title: 'News & Updates'),
        content:
            'Flutter 3.19 is here! Check out the new features and improvements for cross-platform development. What are you most excited about? 💻📱',
        imageUrl: 'assets/images/post_image.jpg',
        timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 3)),
        isEdited: false,
        starCount: 1203,
        commentCount: 112,
      ),
    ];
  }

  void _onStarToggle(String postId) {
    setState(() {
      final postIndex = _posts.indexWhere((p) => p.id == postId);
      if (postIndex != -1) {
        _posts[postIndex].isStarredByCurrentUser =
            !_posts[postIndex].isStarredByCurrentUser;
        if (_posts[postIndex].isStarredByCurrentUser) {
          _posts[postIndex].starCount++;
        } else {
          _posts[postIndex].starCount--;
        }
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            _posts.firstWhere((p) => p.id == postId).isStarredByCurrentUser
                ? 'Post Starred!'
                : 'Post Unstarred!')));
  }

  void _onComment(String postId) {
    setState(() {
      final postIndex = _posts.indexWhere((p) => p.id == postId);
      if (postIndex != -1) {
        _posts[postIndex].commentCount++;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Comment on post $postId. Count updated.')));

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add a comment'),
        content: const TextField(
          decoration: InputDecoration(hintText: 'Write your comment...'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Post'),
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Comment posted (simulated)')));
            },
          ),
        ],
      ),
    );
  }

  void _onShare(String postId) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Share post $postId (simulated)')));
    Share.share('Check out this post: The Briggs-Rauscher Reaction');
  }

  Widget _buildCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return _buildFeedPage();
      case 1:
        return const ExploreMentorsPage();
      case 2:
        return const CoursesPage();
      default:
        return _buildFeedPage();
    }
  }

  Widget _buildFeedPage() {
    return ListView(
      children: [
        const SearchBarWidget(),
        ..._posts
            .map((post) => PostCard(
                  post: post,
                  onStarToggle: _onStarToggle,
                  onComment: _onComment,
                  onShare: _onShare,
                ))
            .toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: _buildCurrentPage(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
