import 'package:flutter/material.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = ["All", "AI & ML", "Product", "Sales", "Public Speaking"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/ux.png', fit: BoxFit.cover),
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
                            color: const Color.fromARGB(255, 0, 85, 155),
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
                    const Text(
                      "Similar Courses",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.indigo,
                  labelColor: Colors.indigo,
                  unselectedLabelColor: Colors.grey,
                  tabs: tabs.map((t) => Tab(text: t)).toList(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: TabBarView(
                  controller: _tabController,
                  children: tabs.map((tab) => _buildCourseList()).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      children: List.generate(5, (index) {
        return Container(
          width: 160,
          margin: const EdgeInsets.only(right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                color: Colors.grey[300],
                child: const Icon(Icons.image, size: 60),
              ),
              const SizedBox(height: 8),
              const Text(
                "Course Title",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text("₹1,500", style: TextStyle(color: Colors.green)),
              const SizedBox(height: 4),
              const Text("15 Lessons", style: TextStyle(color: Colors.grey)),
            ],
          ),
        );
      }),
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
