import 'package:catalift_task/Services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authcontroller = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height / 2.3,
                  decoration: const BoxDecoration(color: Color(0xFF0A125A)),
                ),
                Positioned(
                  top: size.height / 3.8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: .5,
                          ),
                        ),
                        Text(
                          'Log In to Continue',
                          style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: .5,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Enter your credentials',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,
                            letterSpacing: .5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _authcontroller.email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return TextField(
                  controller: _authcontroller.password,
                  obscureText: _authcontroller.obscurePassword.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_authcontroller.obscurePassword.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: _authcontroller.toggleObscure,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: _authcontroller.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _authcontroller.signIn,
                  child: const Text(
                    'LOG IN',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
