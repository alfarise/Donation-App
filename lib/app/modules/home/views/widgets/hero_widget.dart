import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';
import 'package:praktikum/routes/app_pages.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: const DecorationImage(
                    image: AssetImage('assets/images/picture_1.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.linearToSrgbGamma()),
                borderRadius: BorderRadius.circular(16)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Do you really have\ncreative idea?',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Palette.darkColor),
                ),
                const SizedBox(height: 16),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Palette.lightColor,
                      backgroundColor: Palette.primaryColor,
                      padding: const EdgeInsets.all(16),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    Get.toNamed(Routes.START_CAMPAIGN);
                  },
                  child: const Text('Start Campaign'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
