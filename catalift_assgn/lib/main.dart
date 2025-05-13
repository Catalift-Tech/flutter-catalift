import 'package:catalift_assgn/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CataLiftApp());
}

class CataLiftApp extends StatelessWidget {
  const CataLiftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CataLift',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Helvetica',
      ),
      home: const LiveFeedPage(),
    );
  }
}
