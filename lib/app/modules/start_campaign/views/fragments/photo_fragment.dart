import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:praktikum/core/core.dart';

import '../../controllers/start_campaign_controller.dart';

class PhotoFragment extends GetView<StartCampaignController> {
  const PhotoFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Add photo',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'A photo will help tell your story.You can also edit or add more photos later',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 32),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Palette.lightColor,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Palette.lightColor,
                            backgroundColor: Palette.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            await controller.pickImage(ImageSource.gallery);
                          },
                          child: const Text('Gallery'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Palette.lightColor,
                            backgroundColor: Palette.greyColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            await controller.pickImage(ImageSource.camera);
                          },
                          child: const Text('Camera'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Obx(() {
            if (controller.imagePath.value.isNotEmpty) {
              return Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: FileImage(File(controller.imagePath.value)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tap again to change photo!',
                    style: TextStyle(
                      color: Palette.greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: Palette.lightColor,
                ),
                borderRadius: BorderRadius.circular(16),
                color: Palette.lightColor,
              ),
              height: 180,
              child: const Center(
                child: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 48,
                  color: Palette.greyColor,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
