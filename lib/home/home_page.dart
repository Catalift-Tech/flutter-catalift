import 'package:catalift_assignment/utils/widgets/scrollable_tab_bar.dart';
import 'package:flutter/material.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  bool _isTapped = false;

  final List<String> tabs = [
    "All",
    "AI & ML",
    "Product",
    "Sales",
    "Public Speaking",
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/ux.png', fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 16,
                      right: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back button with Card
                        Row(
                          children: [
                            Card(
                              elevation: 4,
                              shape: CircleBorder(),
                              color: const Color.fromARGB(255, 38, 3, 198),
                              child: IconButton(
                                constraints: BoxConstraints(maxWidth: 30),
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Text(
                              'Course Details',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 38, 3, 198),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isTapped = !_isTapped;
                            });
                          },
                          splashColor: Colors.white,
                          highlightColor: Colors.white.withAlpha(100),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _isTapped ? Colors.white : Colors.black,
                              shape: BoxShape.circle,
                            ),

                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.bookmark_border,
                                  color: _isTapped
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.green.shade300,
                      ),
                      foregroundColor: WidgetStateProperty.all(
                        Colors.white,
                      ), // Use foregroundColor to change the text color
                      // iconColor: MaterialStateProperty.all(Colors.green), // This would change the color of an icon if you had one in the button
                    ),
                    child: Text('Highly Enrolled'),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Artificial Intelligence',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 38, 3, 198),
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        '\$1500',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 141, 73),
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.star_border, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text("4.5"),
                      SizedBox(width: 8),
                      Text(
                        "| 8,374 Enrolled",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 147, 157, 246),
                              width: 2,
                            ), // Change the border color and width
                            backgroundColor: const Color.fromARGB(
                              255,
                              207,
                              207,
                              207,
                            ), // Change the background color if desired
                            foregroundColor: Colors
                                .white, // Also consider changing the text color
                          ),
                          onPressed: () {},
                          child: const Text("Add To Cart"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              38,
                              3,
                              198,
                            ),
                            foregroundColor: Colors
                                .white, // Also consider changing the text color
                          ),
                          onPressed: () {},
                          child: const Text("Buy Now"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Similar Courses",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "See All",
                        style: TextStyle(fontSize: 18, color: Colors.black26),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverTabBarDelegate(
              buildScrollableTabBar(
                menuOptions: tabs,
                tabController: _tabController,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 500,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildCourseList(),
                  _buildCourseList(),
                  _buildCourseList(),
                  _buildCourseList(),
                  _buildCourseList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseList() {
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
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabBarDelegate(this._tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: _tabBar);
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;
  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

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
