import 'package:catalift_task/Screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final email    = TextEditingController();
  final password = TextEditingController();

  final isLoading       = false.obs;
  final obscurePassword = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void toggleObscure() => obscurePassword.value = !obscurePassword.value;

  Future<void> signIn() async {
    isLoading.value = true;
    try {
      final creds = await _auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text,
      );

      if (creds.user != null) {
        Get.snackbar('Success', 'Welcome back!');
        Get.offAll(Dashboard());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Authentication failed');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
