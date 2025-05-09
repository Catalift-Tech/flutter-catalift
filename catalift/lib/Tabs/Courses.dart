import 'package:flutter/material.dart';
import '../../Navbar/navbar.dart'; // Import your custom NavBar
import '../../BottomBar/bottom_bar.dart'; // Import your custom BottomBar

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int _currentIndex = 2; // Set the current index to 2 for the "Courses" tab

  void _onTabTapped(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const NavBar(), // Using your custom Navbar here
          Expanded(child: _buildCurrentPage()),
          BottomBar(
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPage() {
    switch (_currentIndex) {
      case 0: return _homePageContent();
      case 1: return const Center(child: Text("Explore Mentors"));
      case 2: return _coursesContent();
      default: return _homePageContent();
    }
  }

  Widget _homePageContent() {
    // This is a placeholder, modify it to show your homepage content
    return const Center(child: Text("Homepage Content"));
  }

  Widget _coursesContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Text(
            "List of Courses",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Browse through the available courses.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 24),
          // Add your course content here
          _courseCard("Flutter Development", Icons.code),
          _courseCard("React Native for Beginners", Icons.mobile_friendly),
          _courseCard("Web Development", Icons.web),
        ],
      ),
    );
  }

  Widget _courseCard(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: Colors.indigo),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
