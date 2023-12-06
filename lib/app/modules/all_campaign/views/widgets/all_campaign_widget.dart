import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/all_campaign_controller.dart';
import '../components/components.dart';

class AllCampaignWidget extends GetView<AllCampaignController> {
  const AllCampaignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      width: double.infinity,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.allCampaignData.length,
          itemBuilder: (context, index) {
            final campaign = controller.allCampaignData[index];

            return CardCampaignComponent(
              id: campaign.id,
              title: campaign.title!,
              description: campaign.description!,
              image: FileImage(File(campaign.imagePath!)),
            );
          },
        ),
      ),
    );
  }
}
