import 'package:flutter/material.dart';
import 'package:new_task_app/constants/color_const.dart';

class ExperienceTile extends StatelessWidget {
  const ExperienceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      titleAlignment: ListTileTitleAlignment.top,
      leading: Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(top: 4),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          child: Image.asset('assets/images/google_icon.png', height: 50),
        ),
      ),
      title: const Text(
        'User Experience Designer',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alphabet Incorporation',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryTextColor,
            ),
          ),
          Text(
            'Aug 2024 - Present',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryTextColor,
            ),
          ),
          Text(
            'Pune, Maharashtra',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '- Creating and refining design samples to kickstart projects for clients, ensuring their vision is well-represented from the outset.\n'
            '- Prototyping, designing, and building landing pages tailored to user needs and business goals.\n'
            '- Expanding my skill set by learning and integrating HTML and CSS into my workflow to enhance front-end development capabilities.\n',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primaryColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
