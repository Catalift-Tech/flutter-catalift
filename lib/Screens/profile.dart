import 'package:catalift_task/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A125A),
        elevation: 0,
        title: InkWell(
          onTap: (){
            Get.offAll(Dashboard());
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'CATA',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: 4),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Text(
                    'LIFT',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(height: 2, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
            tooltip: 'Settings',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/1.png')
                  ),
                  Material(
                    color: Colors.blue,
                    shape: CircleBorder(),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {

                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(Icons.camera_alt, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              Text(
                'Kshitij Ranjan',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email_outlined, color: Colors.blue.shade700, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'kshitij6102004@gmail.com',
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school_outlined, color: Colors.blue.shade700, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Student',
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              Divider(thickness: 1.2, color: Colors.grey[300]),

              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit, color: Colors.blue.shade700),
                    title: Text('Edit Profile', style: GoogleFonts.poppins()),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.lock_outline, color: Colors.blue.shade700),
                    title: Text('Change Password', style: GoogleFonts.poppins()),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.redAccent),
                    title: Text('Logout', style: GoogleFonts.poppins(color: Colors.redAccent)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
