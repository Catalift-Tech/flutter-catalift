import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import '../Models/post.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLiked = false;
  final List<Post> posts = const [
    Post(
      author: "Akhilesh Yadav",
      role: "Founder at Google",
      timeAgo: "1d • Edited",
      content:
      "The Briggs–Rauscher Reaction: A Mesmerizing Chemical Dance 🌈\n\nThis captivating process uses hydrogen peroxide, potassium iodate, malonic acid, manganese sulfate, and starch.\n"
          "Iodine and iodate ions interact to form compounds that shift the solution's color, while starch amplifies the blue color before it breaks down and starts again.💡\n\nFollow @Science for more",
      imageUrl: "https://images.unsplash.com/photo-1531123897727-8f129e1688ce",
      stars: 1546,
      comments: 80,
    ),
    Post(
      author: "Nikita Sharma",
      role: "Physics Researcher",
      timeAgo: "3d",
      content:
      "Watch this cool double pendulum experiment 🎥\nIt’s chaotic but deterministic. Tiny changes in starting conditions make huge changes later. 🌀",
      imageUrl: "https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb",
      stars: 802,
      comments: 34,
    ),
    Post(
      author: "Sahil Patel",
      role: "ML Engineer at Tesla",
      timeAgo: "2h",
      content:
      "Training a model with 1.2B parameters in just 3 hours using distributed TPU pods 🚀🔥\n#AI #MachineLearning",
      imageUrl: "https://images.unsplash.com/photo-1518770660439-4636190af475",
      stars: 2204,
      comments: 114,
    ),
  ];
  final List<String> comments = [];
  final searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A125A),
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'CATA',
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(width: 4),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Text(
                  'LIFT',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(height: 2, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.person_outline), color: Colors.white, onPressed: () {
            Get.offAllNamed('/profile');
          }),
          IconButton(icon: const Icon(Icons.notifications_none), color: Colors.white, onPressed: () {

          }),
          IconButton(icon: const Icon(Icons.chat_bubble_outline), color: Colors.white, onPressed: () {
            Get.offAllNamed('/chats');
          }),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search Bar Row
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          style: GoogleFonts.poppins(fontSize: 16),
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            isDense: true,
                          ),
                          onChanged: (value){
                            setState(() {
                              searchQuery = value;
                            });
                          },
                        ), //TODO: add search functionality
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                elevation: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {}, // TODO: Add action
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.add_box_outlined, color: Colors.blue.shade700, size: 28),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Posts
          ..._filterPosts.map((post) => _buildPostTile(post)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF000B47),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore Mentors"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: "Courses"),
        ],
      ),
    );
  }

  List<Post> get _filterPosts{
    if(searchQuery.isEmpty)
      return posts;
    return posts.where((post) =>
        post.author.toLowerCase().contains(searchQuery.toLowerCase()) ||
        post.role.toLowerCase().contains(searchQuery.toLowerCase()) ||
        post.content.toLowerCase().contains(searchQuery.toLowerCase())
    ).toList();
  }

  Widget _buildPostTile(Post post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.blue.shade100,
                  child: Text(post.author[0], style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.blue.shade800)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.author, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 2),
                      Text("${post.role} • ${post.timeAgo}",
                          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),
                ),
                Icon(Icons.person_add_alt_1, color: Colors.blue.shade300),
              ],
            ),

            const SizedBox(height: 14),

            // Content
            Text(post.content, style: GoogleFonts.poppins(fontSize: 15)),
            const SizedBox(height: 14),

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                post.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),

            // Stats Row
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber.shade600),
                const SizedBox(width: 6),
                Text("${post.stars} Stars", style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                const Spacer(),
                Text("${post.comments} comments", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 6),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  tooltip: 'Like',
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined, color: Colors.grey),
                  onPressed: () {
                    showComments(context);
                  },
                  tooltip: 'Comment',
                ),
                IconButton(
                  icon: const Icon(Icons.share_outlined, color: Colors.grey),
                  onPressed: () {
                    SharePlus.instance.share(
                      ShareParams(
                        text: '${post.content}\n\nby ${post.author}',
                      ),
                    );
                  },
                  tooltip: 'Share',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showComments(BuildContext context) {
    final controller = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              children: [
                // Drag indicator
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Text('Comments', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18)),
                const Divider(),
                Expanded(
                  child: comments.isEmpty
                      ? const Center(child: Text("No comments yet."))
                      : ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo[100],
                        child: Text(comments[index].isNotEmpty ? comments[index][0].toUpperCase() : '?'),
                      ),
                      title: Text(comments[index], style: GoogleFonts.poppins()),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.blue),
                      onPressed: () {
                        final text = controller.text.trim();
                        if (text.isNotEmpty) {
                          setState(() {
                            comments.add(text);
                          });
                          controller.clear();
                          Navigator.of(context).pop();
                          showComments(context);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}
