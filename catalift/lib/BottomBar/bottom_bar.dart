import 'package:flutter/material.dart';
import '../Tabs/Homepage.dart'; // Import the Home page
import '../Tabs/ExploreMentor.dart'; // Import the ExploreMentor page
import '../Tabs/Courses.dart'; // Import the Courses page

class BottomBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const BottomBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF03045E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTab(
            icon: Icons.home,
            label: "Home",
            index: 0,
            context: context,
          ),
          _buildTab(
            icon: Icons.navigation,
            label: "Explore Mentors",
            index: 1,
            context: context,
          ),
          _buildTab(
            icon: Icons.menu_book,
            label: "Courses",
            index: 2,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    final bool isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () {
        // Handle navigation based on the selected tab
        if (index == 0) {
          // Navigate to the Home page when the Home tab is clicked
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
                (Route<dynamic> route) => false, // Remove all previous routes
          );
        } else if (index == 1) {
          // Navigate to ExploreMentors when the Explore Mentors tab is clicked
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ExploreMentor()),
          );
        } else if (index == 2) {
          // Navigate to Courses when the Courses tab is clicked
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CoursesPage()),
          );
        }
        onTap(index); // Switch to the selected tab
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              // Handle navigation based on the selected tab
              if (index == 0) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                      (Route<dynamic> route) => false, // Remove all previous routes
                );
              } else if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ExploreMentor()),
                );
              } else if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CoursesPage()),
                );
              }
              onTap(index); // Switch to the selected tab
            },
            icon: Icon(
              icon,
              color: isSelected ? Colors.amber : Colors.white,
              size: 35,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
