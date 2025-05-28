
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

  
  Widget buildBottomNavigationBar() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        height: 70,
        backgroundColor: AppColors.primary,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(color: Colors.white, fontSize: 12),
        ),
        iconTheme: WidgetStateProperty.all(
          const IconThemeData(color: Colors.white, size: 30),
        ),
      ),
      child: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Explore Mentors',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Courses',
          ),
        ],
      ),
    );
  }
