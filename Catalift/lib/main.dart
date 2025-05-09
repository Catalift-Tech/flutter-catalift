import 'package:flutter/material.dart';

void main() {
  runApp(CataliftApp());
}

class CataliftApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalift Courses',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.indigo,
      ),
      home: CoursesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CoursesScreen extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'title': 'Artificial Intelligence and ML',
      'lessons': '15 Lessons',
      'price': '₹1,500',
      'image': 'assets/imq1.png'
    },
    {
      'title': 'User Interface and User Experience',
      'lessons': '15 Lessons',
      'price': '₹1,500',
      'image': 'assets/imq2.png'
    },
    {
      'title': 'Computer Engineering',
      'lessons': '15 Lessons',
      'price': '₹1,500',
      'image': 'assets/imq3.png'
    },
  ];

  Widget courseCard(Map<String, String> course, {double? width}) {
    return Container(
      width: width ?? 150,
      margin: EdgeInsets.only(right: width == null ? 16 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  course['image']!,
                  width: width ?? 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.bookmark_border, color: Colors.white),
              )
            ],
          ),
          SizedBox(height: 8),
          Text(
            course['lessons']!,
            style: TextStyle(color: Colors.green, fontSize: 12),
          ),
          SizedBox(height: 4),
          Text(
            course['title']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Text(
            course['price']!,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // ← taller
        child: Container(
          color: Color(0xFF03045E),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center, // ← center both axes
          child: SafeArea(
            bottom: false,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 40,
                  fit: BoxFit.contain,
                ),
                Spacer(),
                // Profile icon
                IconButton(
                  icon:
                      Icon(Icons.account_circle_outlined, color: Colors.white),
                  onPressed: () {},
                ),
                // Notifications icon
                IconButton(
                  icon: Icon(Icons.notifications_none, color: Colors.white),
                  onPressed: () {},
                ),
                // Chat icon
                IconButton(
                  icon: Icon(Icons.chat_bubble_outline, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Color(0xFF03045E),
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book), label: 'Courses'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new_rounded),
                        SizedBox(width: 8),
                        Text('Courses',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF03045E),
                            )),
                      ],
                    ),
                    Icon(Icons.shopping_cart_outlined)
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Color(0xFFB0AED3)),
                    prefixIcon: Icon(Icons.search, color: Color(0xFFB0AED3)),
                    suffixIcon: Icon(Icons.tune, color: Color(0xFFB0AED3)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Fully rounded
                      borderSide:
                          BorderSide(color: Color(0xFFB0AED3), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: Color(0xFFB0AED3), width: 1.2),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured For You',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF03045E),
                        )),
                    Text('See All', style: TextStyle(color: Colors.grey))
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: courses.length,
                    itemBuilder: (context, index) => courseCard(courses[index]),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Most Popular',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF03045E),
                        )),
                    Text('See All', style: TextStyle(color: Colors.grey))
                  ],
                ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryPill(
                        label: 'All',
                        isSelected: true,
                        onTap: () {},
                      ),
                      CategoryPill(
                        label: 'AI & ML',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryPill(
                        label: 'Product',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryPill(
                        label: 'Sales',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryPill(
                        label: 'Public Speaking',
                        isSelected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: courses.length,
                    itemBuilder: (context, index) => courseCard(courses[index]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Our Courses',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF03045E),
                        )),
                    Text('See All', style: TextStyle(color: Colors.grey))
                  ],
                ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryPill(
                        label: 'All',
                        isSelected: true,
                        onTap: () {/* toggle logic */},
                      ),
                      CategoryPill(
                        label: 'AI & ML',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryPill(
                        label: 'Product',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryPill(
                        label: 'Sales',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryPill(
                        label: 'Public Speaking',
                        isSelected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: courses.length,
                    itemBuilder: (context, index) => courseCard(courses[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryPill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryPill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Color(0xFF03045E);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? primary : Colors.white,
          border: Border.all(color: primary, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
