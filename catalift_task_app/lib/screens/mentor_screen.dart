import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/app_colors.dart';
import '../constant/app_size.dart';
import '../data/mentors_data.dart';

import '../provider/mentor_provider.dart';

import '../widget/bottom_navigator_bar.dart';
import '../widget/custom_appbar.dart';
import '../widget/mentor_list_view.dart';
import '../widget/search_bar.dart';


class MentorsScreen extends StatefulWidget {
  const MentorsScreen({super.key});

  @override
  State<MentorsScreen> createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen> {
  bool isMyMentorsTab = false;

  @override
  Widget build(BuildContext context) {
    final mentorProvider = Provider.of<MentorProvider>(context);
    final mentors =
        isMyMentorsTab ? mentorProvider.myMentors : exploreMentorsData;

    return Scaffold(
      appBar: myappbar(),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Row(
              children: [
                SizedBox(width: 35),
                Text(
                  'Mentors',
                  style: TextStyle(fontSize: 24, color: AppColors.primary),
                ),
              ],
            ),

            const SizedBox(height: 6),
            mytoggletab(),

            buildsearchbar(),

            const SizedBox(height: 10),

            Expanded(
              child: MentorListView(
                mentors: mentors,
                isMyMentorsTab: isMyMentorsTab,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  mytoggletab() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Container(
        decoration: BoxDecoration(
          
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            buildTab("My Mentors", true),
            const SizedBox(width: 8),
            buildTab("Explore", false),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String label, bool isMyTab) {
    final active = (isMyTab && isMyMentorsTab) || (!isMyTab && !isMyMentorsTab);
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMyMentorsTab = isMyTab),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: active ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
