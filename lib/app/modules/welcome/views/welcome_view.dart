import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';
import 'package:praktikum/routes/app_pages.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/images/vector_1.png')),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'We Need to Change Our Society',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Palette.primaryToDark,
                backgroundColor: Palette.lightColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Get.toNamed(Routes.REGISTER);
              },
              child: const Text('Create Account'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 32),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: Colors.white, width: 2, style: BorderStyle.solid),
                shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const DashboardPage();
                // }));
                Get.toNamed(Routes.DASHBOARD);
              },
              child: const Text('Log In as Guest'),
            ),
          ),
        ],
      ),
    );
  }
}
