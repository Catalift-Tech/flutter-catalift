import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LiveFeedPage extends StatelessWidget {
  const LiveFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // TOP BAR SEPARATE
      body: Column(
        children: [
          const _TopAppBar(),
          const Divider(height: 1, thickness: 0.5),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SearchBar(),

                    const SizedBox(height: 20),
                    const _PostHeader(),

                    const SizedBox(height: 12),
                    const Text(
                      'The Briggs–Rauscher Reaction: A Mesmerizing Chemical Dance 🌈',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'This captivating process uses hydrogen peroxide, potassium iodate, malonic acid, manganese sulfate, and starch.\n'
                      'Iodine and iodate ions interact to form compounds that shift the solution’s color, while starch amplifies the blue color before it breaks down and starts again.💡\n\n'
                      'Follow @Science for more',
                      style: TextStyle(height: 1.5, fontSize: 14),
                    ),
                    const SizedBox(height: 16),

                    // Post Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/post.jpg', // Make sure this asset exists
                        fit: BoxFit.fill,

                        // width: 200,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Stats
                    Row(
                      children: const [
                        Icon(Iconsax.star1, color: Colors.amber, size: 20),
                        SizedBox(width: 6),
                        Text('1,546 Stars'),
                        SizedBox(width: 24),
                        Icon(Iconsax.message, size: 20),
                        SizedBox(width: 6),
                        Text('80 comments'),
                      ],
                    ),
                    const SizedBox(height: 20),

                    const PostActionIconsBar(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF001242),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_2user),
            label: 'Explore Mentors',
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.book), label: 'Courses'),
        ],
      ),
    );
  }
}

class _TopAppBar extends StatelessWidget {
  const _TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF001242),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'CATALIFT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          Row(
            children: const [
              Icon(Iconsax.user, color: Colors.white),
              SizedBox(width: 16),
              Icon(Iconsax.notification, color: Colors.white),
              SizedBox(width: 16),
              Icon(Iconsax.message, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: const [
          Icon(Iconsax.search_normal, color: Colors.grey),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Iconsax.add_square, color: Colors.grey),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(radius: 24, backgroundColor: Colors.grey),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Akhilesh Yadav',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text('Founder at Google', style: TextStyle(color: Colors.grey)),
            Text('1d • Edited', style: TextStyle(color: Colors.grey)),
          ],
        ),
        const Spacer(),
        const Icon(Iconsax.user_add, color: Colors.black),
      ],
    );
  }
}

class PostActionIconsBar extends StatelessWidget {
  const PostActionIconsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Iconsax.star, size: 24),
          Icon(Iconsax.message, size: 24),
          Icon(Iconsax.export_1, size: 24), // Share icon
        ],
      ),
    );
  }
}
