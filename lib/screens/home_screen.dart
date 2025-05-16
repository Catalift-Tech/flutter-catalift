import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/profile_tile.dart';
import '../widgets/post_card.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      body: ListView(
        children: const [
          SearchBarWidget(),
          ProfileTile(),
          PostCard(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
