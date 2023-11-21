import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:praktikum/routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
          email: email, password: password
      );
      Get.snackbar(
        'Success',
        'Login successful',
      );
      Get.back();
      Get.toNamed(Routes.DASHBOARD);
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
