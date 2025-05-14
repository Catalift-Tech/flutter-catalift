import 'package:flutter/material.dart';
import 'package:new_task_app/constants/color_const.dart';
import 'package:new_task_app/screens/home_screen.dart';
import 'package:new_task_app/screens/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalift-App-work',
      themeMode: ThemeMode.light,

      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColors.backgroundColor,
        primaryColor: AppColors.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
