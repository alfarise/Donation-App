import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';

import '../../controllers/all_campaign_controller.dart';

class TopNavbarWidget extends GetView<AllCampaignController>
    implements PreferredSizeWidget {
  const TopNavbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_outlined),
        onPressed: () {
          Get.back();
        },
      ),
      title: const Text(
        'All Campaign',
        style: TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      backgroundColor: Palette.secondaryColor,
      scrolledUnderElevation: 0,
    );
  }
}
