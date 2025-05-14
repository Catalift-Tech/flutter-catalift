import 'package:flutter/material.dart';

Widget studyContent(
  String imagePath,
  String title,
  String price,
  String lessons,
) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            color: Colors.grey[300],
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.bookmark_border, color: Colors.black, size: 24),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
        // overflow: TextOverflow.ellipsis, // Prevents text overflow
        // maxLines: 1,
      ),
      const SizedBox(height: 4),
      Text(price, style: const TextStyle(color: Colors.green)),
      const SizedBox(height: 4),
      Text(lessons, style: const TextStyle(color: Colors.grey)),
    ],
  );
}
