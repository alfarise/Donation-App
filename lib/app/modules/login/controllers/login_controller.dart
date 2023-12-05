import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:praktikum/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appwrite/appwrite.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  RxBool isLoggedIn = false.obs;
  RxBool isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> checkLoginStatus() async {
    isLoggedIn.value = _prefs.containsKey('user_token');
  }

  Future<void> loginUser(String email, String password) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6566886e65d78055e452');
    final account = Account(client);
    try {
      // await _auth.signInWithEmailAndPassword(email: email, password: password);
      // _prefs.setString('user_token', _auth.currentUser!.uid);
      Future session = account.createEmailSession(email: email, password: password);
      session.then((response) {
        isLoading.value = true;
        _prefs.setString('user_token', response.$id);
      }).catchError((error) {
      });
      Get.back();
      Get.snackbar(
        'Success',
        'Login successful',
      );
      Get.toNamed(Routes.DASHBOARD);
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error');
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    _prefs.remove('user_token');
    isLoggedIn.value = false;
    _auth.signOut();
    Get.offAllNamed('/login');
  }
}
