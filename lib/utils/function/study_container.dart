import 'package:catalift_assignment/utils/function/study_content.dart';
import 'package:flutter/material.dart';

Widget studyContainer() {
  return GridView.count(
    crossAxisCount: 2, // Two items per row
    crossAxisSpacing: 12.0, // Spacing between columns
    mainAxisSpacing: 8.0, // Spacing between rows
    childAspectRatio: 0.8, // Adjust this ratio to give more vertical space

    physics:
        const NeverScrollableScrollPhysics(), // Disables scrolling within the GridView
    children: [
      studyContent(
        'assets/ai.png',
        "Artificial Intelligence and ML",
        "\$1500",
        '15 Lessons',
      ),
      studyContent(
        'assets/ux.png',
        "Artificial Intelligence and ML",
        "\$1500",
        '15 Lessons',
      ),
      studyContent(
        'assets/coding.png',
        "Artificial Intelligence and ML",
        "\$1500",
        '15 Lessons',
      ),
      studyContent(
        'assets/ai.png',
        "Artificial Intelligence and ML",
        "\$1500",
        '15 Lessons',
      ),
    ],
  );
}
