import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'The Briggs-Rauscher Reaction: A Mesmerizing Chemical Dance',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'This captivating process uses hydrogen peroxide, potassium iodate, malonic acid, manganese sulfate, and starch...',
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(height: 8),
              const Text('Follow @Science for more',
                  style: TextStyle(fontStyle: FontStyle.italic)),
              const SizedBox(height: 12),
              Image.network(
                  'https://thumbs.dreamstime.com/b/adult-indian-university-student-portrait-college-bag-books-asian-man-standing-plain-background-shadow-copy-56594852.jpg'), // Replace with actual image URL
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4),
                      const Text('1,546 Stars'),
                    ],
                  ),
                  const Text('80 comments'),
                  IconButton(icon: const Icon(Icons.send), onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
