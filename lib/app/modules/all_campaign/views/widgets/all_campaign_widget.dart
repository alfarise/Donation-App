import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/all_campaign_controller.dart';
import '../components/components.dart';

class AllCampaignWidget extends GetView<AllCampaignController> {
  const AllCampaignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<CardCampaignComponent> campaigns = [];

    controller.allCampaignData.forEach((campaign) {
      campaigns.add(CardCampaignComponent(
        title: campaign['title']!,
        description: campaign['description']!,
        image: FileImage(File(campaign['imagePath']!)),
      ));
    });
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: campaigns,
      ),
    );
  }
}
