import 'package:flutter/material.dart';
import '../../Navbar/navbar.dart'; // Your custom NavBar
import '../../BottomBar/bottom_bar.dart'; // Your custom BottomBar

class ExploreMentor extends StatefulWidget {
  const ExploreMentor({super.key});

  @override
  State<ExploreMentor> createState() => _ExploreMentorState();
}

class _ExploreMentorState extends State<ExploreMentor> {
  int _currentIndex = 1;
  int _selectedTabIndex = 0;
  String _searchQuery = '';

  // Distinct mentor profiles
  final List<Mentor> _allMentors = [
    Mentor(
      name: "Gaurav Samant",
      rating: "4.9",
      field: "IT Sector",
      experience: "4 years",
      qualification: "Business Administration",
      reviews: "175 Reviews",
      description:
      "Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon . ESCP Europe | 32+ National Case Comps Podiums",
      compatibility: "98%",
      imageUrl: 'https://i.pravatar.cc/150?img=3',
    ),
    Mentor(
      name: "Aarav Mehta",
      rating: "4.7",
      field: "Data Science",
      experience: "6 years",
      qualification: "AI & ML Expert",
      reviews: "102 Reviews",
      description:
      "Data Scientist @Google | Ex-Amazon | IIT Bombay | Kaggle Grandmaster",
      compatibility: "96%",
      imageUrl: 'https://i.pravatar.cc/150?img=5',
    ),
    Mentor(
      name: "Nidhi Kapoor",
      rating: "4.8",
      field: "Product Management",
      experience: "5 years",
      qualification: "MBA, IIM Ahmedabad",
      reviews: "88 Reviews",
      description:
      "PM @Meta | Ex-Zomato | Harvard Business School Exchange Program",
      compatibility: "97%",
      imageUrl: 'https://i.pravatar.cc/150?img=15',
    ),
    Mentor(
      name: "Rajeev Khanna",
      rating: "4.6",
      field: "Finance",
      experience: "8 years",
      qualification: "Chartered Accountant",
      reviews: "120 Reviews",
      description:
      "VP Finance @HSBC | Ex-KPMG | CFA Level 3 | Delhi University Topper",
      compatibility: "95%",
      imageUrl: 'https://i.pravatar.cc/150?img=20',
    ),
    Mentor(
      name: "Shruti Desai",
      rating: "4.9",
      field: "Design",
      experience: "7 years",
      qualification: "UX Designer",
      reviews: "140 Reviews",
      description:
      "Lead UX Designer @Adobe | Ex-Myntra | NID Graduate | TEDx Speaker",
      compatibility: "99%",
      imageUrl: 'https://i.pravatar.cc/150?img=40',
    ),
  ];

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  void _onMentorTabSelected(int index) {
    setState(() => _selectedTabIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    // Filter mentors based on search query
    final List<Mentor> _filteredMentors = _allMentors.where((mentor) {
      final query = _searchQuery.toLowerCase();
      return mentor.name.toLowerCase().contains(query) ||
          mentor.field.toLowerCase().contains(query) ||
          mentor.qualification.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const NavBar(),

          // Mentors title
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mentors',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ),
          ),

          _buildTabSwitcher(),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() => _searchQuery = value);
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search mentors...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // Mentor cards
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredMentors.length,
              itemBuilder: (context, index) => MentorCard(mentor: _filteredMentors[index]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  Widget _buildTabSwitcher() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F8),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            _buildTab("My Mentors", 0),
            _buildTab("Explore", 1),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => _onMentorTabSelected(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF000066) : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF000066),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Mentor {
  final String name;
  final String rating;
  final String field;
  final String experience;
  final String qualification;
  final String reviews;
  final String description;
  final String compatibility;
  final String imageUrl;

  Mentor({
    required this.name,
    required this.rating,
    required this.field,
    required this.experience,
    required this.qualification,
    required this.reviews,
    required this.description,
    required this.compatibility,
    required this.imageUrl,
  });
}

class MentorCard extends StatelessWidget {
  final Mentor mentor;
  const MentorCard({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                mentor.imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(mentor.rating, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(mentor.field, style: const TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(mentor.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.timelapse, size: 16),
                      const SizedBox(width: 4),
                      Text(mentor.experience),
                      const SizedBox(width: 12),
                      const Icon(Icons.school, size: 16),
                      const SizedBox(width: 4),
                      Text(mentor.qualification),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.rate_review_outlined, size: 16),
                      const SizedBox(width: 4),
                      Text(mentor.reviews),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(mentor.description, style: const TextStyle(color: Colors.black87)),
                  const SizedBox(height: 12),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: mentor.compatibility,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const TextSpan(text: ' compatibility'),
                      ],
                    ),
                    style: const TextStyle(color: Colors.green),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
