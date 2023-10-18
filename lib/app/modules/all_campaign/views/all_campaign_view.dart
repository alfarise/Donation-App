import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';

import '../controllers/all_campaign_controller.dart';
import 'widgets/widgets.dart';

class AllCampaignView extends GetView<AllCampaignController> {
  const AllCampaignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavbarWidget(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Palette.lightColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Palette.lightColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      suffixIcon: const Icon(Icons.tune_outlined),
                      suffixIconColor: Palette.primaryColor,
                      hintText: 'Looking for something?',
                      filled: true,
                      fillColor: Palette.lightColor)),
            ),
            const Expanded(
              child: AllCampaignWidget(),
            )
          ],
        ),
      ),
    );
  }
}
