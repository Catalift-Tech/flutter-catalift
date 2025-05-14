import 'package:flutter/material.dart';
import 'package:new_task_app/constants/color_const.dart';
import 'package:new_task_app/widgets/profile/animated_button.dart';
import 'package:new_task_app/widgets/profile/experience_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //profile header
            Headerwidget(),

            // User Name and Verified Icon
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileIntroWidget(),
                  const SizedBox(height: 40),

                  // Experience
                  ExperienceSection(),

                  const SizedBox(height: 20),

                  // Education
                  EducationSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileIntroWidget extends StatelessWidget {
  const ProfileIntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // User Name and Verified Icon
        Row(
          children: [
            const Text(
              'Nikhil Singh',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.verified,
              size: 30,
              color: AppColors.primaryColor.withOpacity(0.9),
            ),
          ],
        ),

        // const SizedBox(height: 2),
        //star rating
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.star_border_purple500_sharp,
              size: 24,
              color: Colors.amber,
            ),
            const SizedBox(width: 5),
            const Text(
              '4.5',
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Text(
          'Flutter Developer and UI UX Designer/Researcher',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Image.asset(
              'assets/images/google_text.png',
              height: 50,
              fit: BoxFit.cover,
            ),

            Container(
              height: 20,
              width: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
            ),
            const Text(
              'Oxford University',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 20,
              width: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
            ),
            const Text(
              'Mechanical Engineer',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Connect and Message buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedButton(text: 'Connect', onTap: () {}, primary: true),
            const SizedBox(width: 20),
            AnimatedButton(text: 'Message', onTap: () {}, primary: false),
          ],
        ),

        const SizedBox(height: 20),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Experience',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return const ExperienceTile();
          },
        ),
      ],
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Education',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return const ExperienceTile();
          },
        ),
      ],
    );
  }
}

class Headerwidget extends StatelessWidget {
  const Headerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Column(
          children: [
            Stack(
              children: [
                // Background image
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1542831371-29b0f74f9713?q=80&w=1000&auto=format&fit=crop',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Gradient background
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.secondaryColor.withOpacity(0.1),
                        AppColors.primaryColor.withOpacity(0.2),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),

        // Back button
        Positioned(
          top: 40,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo.shade900,
            ),
            child: IconButton(
              iconSize: 30,
              icon: const Icon(Icons.chevron_left, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),

        // Profile image
        Positioned(
          bottom: -50,
          left: 20,
          child: Container(
            height: 200,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: const DecorationImage(
                image: AssetImage('assets/images/profile_pic.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
