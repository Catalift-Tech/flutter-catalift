import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/screens/login/login_screen.dart';
import 'package:get/get.dart';

import '../register/register_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to Onboarding'),
          ElevatedButton(
            onPressed: () => Get.to(LoginScreen()),
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: () => Get.to(RegisterScreen()),
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
