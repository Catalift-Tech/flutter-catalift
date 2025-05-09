import 'package:flutter/material.dart';
import '../../Navbar/navbar.dart';
import '../../BottomBar/bottom_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const NavBar(),
          Expanded(child: _buildCurrentPage()),
          BottomBar(currentIndex: _currentIndex, onTap: _onTabTapped),
        ],
      ),
    );
  }

  Widget _buildCurrentPage() {
    switch (_currentIndex) {
      case 0: return _homePageContent();
      case 1: return const Center(child: Text("Explore Mentors"));
      case 2: return const Center(child: Text("Courses"));
      default: return _homePageContent();
    }
  }

  Widget _homePageContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Text("Hey, Sudhanshu", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("What task do you want to do today?", style: TextStyle(fontSize: 16, color: Colors.black54)),
          const SizedBox(height: 24),
          _searchBar(),
          const SizedBox(height: 24),
          _categoriesSection(),
          const SizedBox(height: 24),
          _popularNowSection(),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
      child: const TextField(
        decoration: InputDecoration(icon: Icon(Icons.search), hintText: "Search tasks...", border: InputBorder.none),
      ),
    );
  }

  Widget _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _CategoryCard(icon: Icons.brush, title: "Design"),
              _CategoryCard(icon: Icons.code, title: "Coding"),
              _CategoryCard(icon: Icons.campaign, title: "Marketing"),
              _CategoryCard(icon: Icons.calculate, title: "Finance"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _popularNowSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Popular Now", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        _TaskCard(title: "Landing Page Design", icon: Icons.web),
        _TaskCard(title: "Build a Chat App", icon: Icons.chat_bubble_outline),
        _TaskCard(title: "Instagram Marketing", icon: Icons.camera_alt),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  const _CategoryCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.indigo),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const _TaskCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Icon(icon, size: 32, color: Colors.indigo),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
