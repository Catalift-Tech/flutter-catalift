import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final unselectedColor =
        theme.bottomNavigationBarTheme.unselectedItemColor ?? Colors.white70;
    final selectedColor =
        theme.bottomNavigationBarTheme.selectedItemColor ?? Colors.white;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,
              color: currentIndex == 0 ? selectedColor : unselectedColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined,
              color: currentIndex == 1 ? selectedColor : unselectedColor),
          label: 'Explore Mentors',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school_outlined,
              color: currentIndex == 2 ? selectedColor : unselectedColor),
          label: 'Courses',
        ),
      ],
    );
  }
}
