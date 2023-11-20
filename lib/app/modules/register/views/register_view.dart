import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.secondaryColor,
        scrolledUnderElevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Palette.lightColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Palette.lightColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: Palette.lightColor,
                prefixIcon: const Icon(Icons.mail_outlined),
                hintText: 'Email',
              ),
              controller: controller.emailController,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Palette.lightColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Palette.lightColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: Palette.lightColor,
                prefixIcon: const Icon(Icons.lock_outlined),
                hintText: 'Password',
              ),
              controller: controller.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Palette.lightColor,
                backgroundColor: Palette.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                controller.registerUser(controller.emailController.text,
                    controller.passwordController.text);
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
