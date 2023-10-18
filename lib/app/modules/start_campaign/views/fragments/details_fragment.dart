import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';

import '../../controllers/start_campaign_controller.dart';

class DetailsFragment extends GetView<StartCampaignController> {
  const DetailsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Describe about your campaign',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        const Text(
          'Fundraiser Title',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
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
          ),
          controller: controller.titleController,
        ),
        const SizedBox(height: 16),
        const Text(
          'Description',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
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
          ),
          maxLines: 8,
          controller: controller.detailsController,
        )
      ],
    );
  }
}
