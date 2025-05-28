import 'package:flutter/material.dart';
import '../model/mentor_model.dart';
import '../data/mentors_data.dart';

class MentorProvider with ChangeNotifier {
  final List<Mentor> _myMentors = [...myMentorsData];

  List<Mentor> get myMentors => _myMentors;

  void addMentor(Mentor mentor) {
    if (!_myMentors.any((m) => m.id == mentor.id)) {
      _myMentors.add(mentor);
      notifyListeners();
    }
  }

  void removeMentor(Mentor mentor) {
    _myMentors.removeWhere((m) => m.id == mentor.id);
    notifyListeners();
  }
}
