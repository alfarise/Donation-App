import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';

import '../../controllers/dashboard_controller.dart';

typedef ChangeIndexCallback = Function(int index);

class BottomNavbarWidget extends GetView<DashboardController> {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Palette.primaryColor),
          selectedItemColor: Palette.primaryColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            controller.changeIndex(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ));
  }
}
