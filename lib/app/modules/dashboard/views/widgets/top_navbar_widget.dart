import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/app/modules/controllers.dart';
import 'package:praktikum/core/core.dart';
import 'package:praktikum/routes/app_pages.dart';

import '../../controllers/dashboard_controller.dart';

class TopNavbarWidget extends GetView<DashboardController>
    implements PreferredSizeWidget {
  TopNavbarWidget({super.key});
  final login = Get.find<LoginController>();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Get.toNamed(Routes.TODOS);
        },
      ),
      backgroundColor: Palette.secondaryColor,
      scrolledUnderElevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notification Icon')));
          },
        ),
        GestureDetector(
          child: Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/user.jpg'),
                  fit: BoxFit.fill)),
        ),
        onTap: () => {
          login.logout()
        },),
      ],
    );
  }
}
