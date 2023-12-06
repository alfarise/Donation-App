import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';
import 'package:praktikum/routes/app_pages.dart';

import '../../controllers/all_campaign_controller.dart';

class CardCampaignComponent extends GetView<AllCampaignController> {
  const CardCampaignComponent({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  final String id;
  final String title;
  final String description;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 16),
      height: 360,
      decoration: BoxDecoration(
        color: Palette.lightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Container(
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                      right: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Palette.lightColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // print('Document id:: $id');
                        // controller.deleteCampaign(id);
                        Get.toNamed(Routes.START_CAMPAIGN, arguments: id);
                      },
                      icon: const Icon(Icons.edit_rounded),
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                      right: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Palette.lightColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // print('Document id:: $id');
                        controller.deleteCampaign(id);
                      },
                      icon: const Icon(Icons.delete_rounded),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Palette.darkColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Goals: \$5.000',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  'Raised of \$2.000 (60%)',
                  style: TextStyle(
                    color: Palette.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
