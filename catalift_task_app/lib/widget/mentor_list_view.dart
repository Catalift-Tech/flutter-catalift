import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/mentor_model.dart';
import '../provider/mentor_provider.dart';
import 'mentor_card.dart';
import 'custom_snakbar.dart';

class MentorListView extends StatelessWidget {
  final List<Mentor> mentors;
  final bool isMyMentorsTab;

  const MentorListView({
    super.key,
    required this.mentors,
    required this.isMyMentorsTab,
  });

  @override
  Widget build(BuildContext context) {
    final mentorProvider = Provider.of<MentorProvider>(context, listen: false);

    if (mentors.isEmpty) {
      return const Center(
        child: Text(
          "No mentors available.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: mentors.length,
      itemBuilder: (context, index) {
        final mentor = mentors[index];

        if (isMyMentorsTab) {
          return Dismissible(
            key: Key('${mentor.id}-${mentor.name}'),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              mentorProvider.removeMentor(mentor);
              CustomSnackBar.showCenter(
                context: context,
                message: '${mentor.name} removed from My Mentors',
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: MentorCard(mentor: mentor),
          );
        } else {
          return GestureDetector(
            onDoubleTap: () {
              mentorProvider.addMentor(mentor);
              CustomSnackBar.showCenter(
                context: context,
                message: '${mentor.name} added to My Mentors',
              );
            },
            child: MentorCard(mentor: mentor),
          );
        }
      },
    );
  }
}
