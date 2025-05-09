import 'package:flutter/material.dart';
import 'profile.dart';
import 'notifications.dart';
import 'messages.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF03045E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // CATA + FILT
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'CATA',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 4),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 38,
                    height: 2,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 4),
                  ),
                  const Text(
                    'FILT',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Icons
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                },
                child: const Icon(Icons.person, color: Colors.white, size: 34),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsPage()));
                },
                child: const Icon(Icons.notifications_none, color: Colors.white, size: 34),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MessagesPage()));
                },
                child: const Icon(Icons.message_outlined, color: Colors.white, size: 34),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
