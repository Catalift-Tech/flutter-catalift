import 'package:cataliftapp/themes.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'CATALIFT',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 22,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.person_outline,
              color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Profile Clicked')));
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications_none,
              color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications Clicked')));
          },
        ),
        IconButton(
          icon: Icon(Icons.chat_bubble_outline,
              color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Chat Clicked')));
          },
        ),
        IconButton(
          icon: Icon(
            themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            themeNotifier.toggleTheme();
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
