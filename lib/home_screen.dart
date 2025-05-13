import 'package:catalift_developer_task/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/Catalift.png', width: 130),
        toolbarHeight: 70,
        actions: [
          Icon(Icons.person_2_outlined, size: 30, color: Colors.white),
          SizedBox(width: 18),
          Icon(Icons.notifications_outlined, size: 30, color: Colors.white),
          SizedBox(width: 18),
          Icon(Icons.message_outlined, size: 30, color: Colors.white),
          SizedBox(width: 18),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.75,
                    height: 50,
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade400,
                          ),
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Icon(Icons.add_box_outlined, color: color1, size: 35),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey.shade300,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Akhilesh Yadav",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Founder at Google',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '1d • Edited',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.35),
                          Icon(Icons.person_add_alt_outlined, size: 30),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'The Briggs-Rauscher Reaction: A Mesmerizing Chemical Dance 🌈',
                maxLines: 2,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'This captivating process uses hydrogen peroxide, potassium iodate, malonic acid, manganese sulfate, and starch.',
                maxLines: 3,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Iodine and iodate ions interact to form compounds that shift the solution\'s color, while starch amplifies the blue color before it breaks down and starts again.💡',
                maxLines: 4,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text('Follow @Science for more', style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Image.asset('assets/photo.jpg'),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.star_rounded, size: 37, color: Colors.yellow[200]),
                  SizedBox(width: 5),
                  Text(
                    '1,546 Stars',
                    style: TextStyle(
                      color: color1,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: size.width * 0.32),
                  Text(
                    '80 comments',
                    style: TextStyle(
                      color: color1,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(color: color1, thickness: 0.5),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.star_border_rounded, color: color1, size: 30),
                  Icon(Icons.message_outlined, color: color1, size: 30),
                  Icon(Icons.send_rounded, color: color1, size: 30),
                ],
              ),
              SizedBox(height: 5),
              Divider(color: color1, thickness: 0.5),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: size.width,
        height: 70,
        color: color1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_outlined, color: Colors.white, size: 30),
                SizedBox(height: 5),
                Text("Home", style: TextStyle(color: Colors.white)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.explore_outlined, color: Colors.white, size: 30),
                SizedBox(height: 5),
                Text("Explore Mentors", style: TextStyle(color: Colors.white)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu_book_outlined, color: Colors.white, size: 30),
                SizedBox(height: 5),
                Text("Courses", style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
