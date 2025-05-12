import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/services/auth_service.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';
//import 'package:onboarding_app/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  //final AuthController authController = Get.put(AuthController());
  final _authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _loginWithEmail(String email, String password) async {
    try {
      _authService.signInWithEmailPassword(email, password);
      Get.snackbar("Success", "Logged in successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final user = await _authService.signInWithGoogle();

      if (user != null) {
        Get.snackbar("Success", "Google sign-in successful");
        Get.offAll(() => const HomeScreen()); // Navigate to home page
      } else {
        Get.snackbar("Cancelled", "Google sign-in was cancelled");
      }
    } catch (e) {
      Get.snackbar("Google Sign-In Failed", e.toString());
      print(e); // Log the error for further debugging
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                _loginWithEmail(email, password);
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _signInWithGoogle();
              },
              child: Text('Login with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
