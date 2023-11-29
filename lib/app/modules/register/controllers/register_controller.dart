import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:praktikum/routes/app_pages.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> registerUser(String name, String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Client client = Client();
      client
          .setEndpoint("https://cloud.appwrite.io/v1")
          .setProject("6566886e65d78055e452");
      Account account = Account(client);
      await account.create(
          userId: ID.unique(),
          email: email,
          password: password,
          name: name
      );

      Get.back();
      Get.snackbar(
        'Success',
        'Registration successful',
      );
      Get.toNamed(Routes.LOGIN);
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
