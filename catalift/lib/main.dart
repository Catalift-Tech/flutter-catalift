import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const CataliftApp());
}

class CataliftApp extends StatelessWidget {
  const CataliftApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CATALIFT',
      theme: ThemeData(
        primaryColor: const Color(0xFF0A0A5E), // Dark navy blue
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isStarred = false;
  int _starCount = 1546;
  int _commentCount = 80;
  bool _isFollowing = false;
  final TextEditingController _searchController = TextEditingController();
  final List<Post> _posts = [];
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    _loadUserPreferences();
    _loadPosts();
  }
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  
  Future<void> _loadUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isStarred = prefs.getBool('isStarred_post1') ?? false;
      _isFollowing = prefs.getBool('isFollowing_science') ?? false;
    });
  }
  
  Future<void> _saveUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isStarred_post1', _isStarred);
    await prefs.setBool('isFollowing_science', _isFollowing);
  }
  
  void _loadPosts() {
    // Simulate loading posts from an API
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _posts.add(
          Post(
            id: '1',
            userName: 'Akhilesh Yadav',
            userTitle: 'Founder at Google',
            timeAgo: '1d',
            isEdited: true,
            title: 'The Briggs-Rauscher Reaction: A Mesmerizing Chemical Dance 🌈',
            content: 'This captivating process uses hydrogen peroxide, potassium iodate, malonic acid, manganese sulfate, and starch.\n\nIodine and iodate ions interact to form compounds that shift the solution\'s color, while starch amplifies the blue color before it breaks down and starts again. ✨',
            followTag: '@Science',
            starCount: 1546,
            commentCount: 80,
          ),
        );
        _isLoading = false;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    // Show different content based on selected tab
    if (index == 0) {
      // Home tab - already showing
    } else if (index == 1) {
      _showExploreScreen();
    } else if (index == 2) {
      _showCoursesScreen();
    }
  }

  void _showExploreScreen() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const Text(
                'Explore Mentors',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(Icons.person, color: Colors.grey.shade700),
                  ),
                  title: Text('Mentor ${index + 1}'),
                  subtitle: Text('Expert in ${_getRandomExpertise()}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Connected with Mentor ${index + 1}')),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A0A5E),
                    ),
                    child: const Text('Connect'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).then((_) {
      setState(() {
        _selectedIndex = 0; // Reset to home tab after closing
      });
    });
  }

  void _showCoursesScreen() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const Text(
                'Available Courses',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 8,
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getRandomCourseTitle(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Instructor: ${_getRandomInstructor()}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '${4 + (index % 2)}.${(index * 2) % 10}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '(${100 + index * 25} reviews)',
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Enrolled in ${_getRandomCourseTitle()}')),
                            );
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0A0A5E),
                            minimumSize: const Size(double.infinity, 40),
                          ),
                          child: const Text('Enroll Now'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).then((_) {
      setState(() {
        _selectedIndex = 0; // Reset to home tab after closing
      });
    });
  }

  String _getRandomExpertise() {
    final expertises = [
      'Machine Learning',
      'Data Science',
      'Web Development',
      'Mobile Apps',
      'UI/UX Design',
      'Blockchain',
      'Cloud Computing',
    ];
    return expertises[DateTime.now().millisecond % expertises.length];
  }

  String _getRandomCourseTitle() {
    final titles = [
      'Advanced Flutter Development',
      'Machine Learning Fundamentals',
      'Full-Stack Web Development',
      'UI/UX Design Masterclass',
      'Data Science with Python',
      'Cloud Architecture',
      'Blockchain Development',
      'Mobile App Design',
    ];
    return titles[DateTime.now().millisecond % titles.length];
  }

  String _getRandomInstructor() {
    final instructors = [
      'Dr. Sarah Johnson',
      'Prof. Michael Chen',
      'Eng. David Williams',
      'Lisa Rodriguez',
      'Robert Kim',
      'Jennifer Taylor',
    ];
    return instructors[DateTime.now().millisecond % instructors.length];
  }

  void _toggleStar() {
    setState(() {
      _isStarred = !_isStarred;
      _starCount += _isStarred ? 1 : -1;
    });
    _saveUserPreferences();
  }

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
    _saveUserPreferences();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isFollowing ? 'Following @Science' : 'Unfollowed @Science'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showComments() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const Text(
                'Comments',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: _commentCount,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(Icons.person, color: Colors.grey.shade700),
                  ),
                  title: Text('User ${index + 1}'),
                  subtitle: Text('This is comment #${index + 1}. ${index % 3 == 0 ? "Very interesting reaction!" : index % 3 == 1 ? "I tried this in my lab!" : "Thanks for sharing this information."}'),
                  trailing: Text('${index % 24}h ago', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF0A0A5E)),
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Comment posted')),
                      );
                      setState(() {
                        _commentCount++;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sharePost() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Share via',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShareOption(Icons.message, 'Message', Colors.blue),
                _buildShareOption(Icons.email, 'Email', Colors.red),
                _buildShareOption(Icons.link, 'Copy Link', Colors.green),
                _buildShareOption(Icons.more_horiz, 'More', Colors.purple),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption(IconData icon, String label, Color color) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Shared via $label')),
        );
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  void _showProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.person, size: 50, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your Name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'user@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildProfileOption(Icons.person_outline, 'Edit Profile'),
                  _buildProfileOption(Icons.settings, 'Settings'),
                  _buildProfileOption(Icons.bookmark_border, 'Saved Posts'),
                  _buildProfileOption(Icons.history, 'Activity History'),
                  _buildProfileOption(Icons.help_outline, 'Help & Support'),
                  _buildProfileOption(Icons.logout, 'Logout'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF0A0A5E)),
      title: Text(label),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label tapped')),
        );
      },
    );
  }

  void _showNotifications() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 15,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: index % 3 == 0 
                        ? Colors.blue.withOpacity(0.1) 
                        : index % 3 == 1 
                            ? Colors.green.withOpacity(0.1) 
                            : Colors.orange.withOpacity(0.1),
                    child: Icon(
                      index % 3 == 0 
                          ? Icons.star 
                          : index % 3 == 1 
                              ? Icons.comment 
                              : Icons.person_add,
                      color: index % 3 == 0 
                          ? Colors.blue 
                          : index % 3 == 1 
                              ? Colors.green 
                              : Colors.orange,
                    ),
                  ),
                  title: Text(
                    index % 3 == 0 
                        ? 'User ${index + 1} starred your post' 
                        : index % 3 == 1 
                            ? 'User ${index + 1} commented on your post' 
                            : 'User ${index + 1} started following you',
                  ),
                  subtitle: Text('${index % 24}h ago'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessages() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const Text(
                'Messages',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(Icons.person, color: Colors.grey.shade700),
                  ),
                  title: Text('User ${index + 1}'),
                  subtitle: Text(
                    index % 2 == 0 
                        ? 'Hey, I saw your post about the chemical reaction!' 
                        : 'Thanks for sharing that information!',
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${index % 24}h ago',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (index % 3 == 0)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Chat with User ${index + 1} opened')),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreatePost() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Create Post',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'What\'s on your mind?',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.image),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add image selected')),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.link),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add link selected')),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.tag),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add tag selected')),
                      );
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Post created successfully')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A0A5E),
                    ),
                    child: const Text('Post'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _performSearch(String query) {
    if (query.isEmpty) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Searching for: $query')),
    );
    
    // Clear search field after search
    _searchController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App Bar
          Container(
            color: const Color(0xFF0A0A5E),
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 12),
            child: Row(
              children: [
                const Text(
                  'CATALIFT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.person_outline, color: Colors.white),
                  onPressed: _showProfile,
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_none, color: Colors.white),
                  onPressed: _showNotifications,
                ),
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
                  onPressed: _showMessages,
                ),
              ],
            ),
          ),
          
          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      onSubmitted: _performSearch,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: _showCreatePost,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF0A0A5E)),
                    ),
                    child: const Icon(Icons.add, color: Color(0xFF0A0A5E)),
                  ),
                ),
              ],
            ),
          ),
          
          // Content - Scrollable
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: ListView.builder(
                      itemCount: _posts.length,
                      itemBuilder: (context, index) {
                        final post = _posts[index];
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Post Header
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Profile Picture
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      // User Info
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              post.userName,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              post.userTitle,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  post.timeAgo,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                if (post.isEdited) ...[
                                                  const SizedBox(width: 8),
                                                  Container(
                                                    width: 4,
                                                    height: 4,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  const Text(
                                                    'Edited',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Follow Button
                                      InkWell(
                                        onTap: _toggleFollow,
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _isFollowing 
                                                  ? const Color(0xFF0A0A5E) 
                                                  : Colors.grey.shade300,
                                            ),
                                            shape: BoxShape.circle,
                                            color: _isFollowing 
                                                ? const Color(0xFF0A0A5E).withOpacity(0.1) 
                                                : Colors.transparent,
                                          ),
                                          child: Icon(
                                            _isFollowing ? Icons.person_remove_outlined : Icons.person_add_outlined,
                                            size: 18,
                                            color: _isFollowing ? const Color(0xFF0A0A5E) : Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  
                                  // Post Title
                                  Text(
                                    post.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  
                                  // Post Content
                                  Text(
                                    post.content,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 8),
                                  
                                  // Follow Tag
                                  InkWell(
                                    onTap: _toggleFollow,
                                    child: Text(
                                      'Follow ${post.followTag} for more',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: _isFollowing ? const Color(0xFF0A0A5E) : Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  
                                  // Post Image - Using SVG instead of PNG
                                  Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/catalift_task_live_feed_home-QdKfPWCLWC8cjtO1OgHOwAKU2Y5jdT.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                                  const SizedBox(height: 12),
                                  
                                  // Post Stats
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.amber, size: 18),
                                          const SizedBox(width: 4),
                                          Text(
                                            '$_starCount Stars',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: _showComments,
                                        child: Text(
                                          '$_commentCount comments',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF0A0A5E),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  
                                  // Action Buttons
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          _isStarred ? Icons.star : Icons.star_border,
                                          color: _isStarred ? Colors.amber : Colors.grey,
                                        ),
                                        onPressed: _toggleStar,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.chat_bubble_outline),
                                        onPressed: _showComments,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.share),
                                        onPressed: _sharePost,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            
                            // Divider
                            Container(
                              height: 8,
                              color: Colors.grey.shade100,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0A0A5E),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF0A0A5E),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore Mentors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Courses',
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final String id;
  final String userName;
  final String userTitle;
  final String timeAgo;
  final bool isEdited;
  final String title;
  final String content;
  final String followTag;
  final int starCount;
  final int commentCount;

  Post({
    required this.id,
    required this.userName,
    required this.userTitle,
    required this.timeAgo,
    required this.isEdited,
    required this.title,
    required this.content,
    required this.followTag,
    required this.starCount,
    required this.commentCount,
  });
}
