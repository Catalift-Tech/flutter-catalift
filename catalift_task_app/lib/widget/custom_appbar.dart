import 'package:flutter/material.dart';

import '../constant/app_colors.dart';



myappbar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [buildLogo()],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          color: Colors.white,
          iconSize: 28,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          color: Colors.white,
          iconSize: 28,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.messenger_outline_outlined),
          color: Colors.white,
          iconSize: 28,
          onPressed: () {},
        ),
      ],
    );
    
  }

Widget buildLogo() {
    return Stack(
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 16, letterSpacing: 2),
            children: [
              TextSpan(
                text: "CATA",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: "LIFT", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(width: 38, height: 2, color: Colors.white),
        ),
      ],
    );
  }
