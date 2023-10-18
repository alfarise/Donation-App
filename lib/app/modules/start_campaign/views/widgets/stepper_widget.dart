import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';

import '../../controllers/start_campaign_controller.dart';

class StepperWidget extends GetView<StartCampaignController> {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => EasyStepper(
          activeStep: controller.currentStep.value,
          lineStyle: LineStyle(
            lineLength: MediaQuery.of(context).size.width * 0.255,
            lineSpace: 0,
            lineThickness: 4,
            lineType: LineType.normal,
            defaultLineColor: Palette.greyColor,
            finishedLineColor: Palette.primaryColor,
          ),
          activeStepTextColor: Palette.darkColor,
          finishedStepTextColor: Palette.darkColor,
          internalPadding: 0,
          showLoadingAnimation: false,
          stepRadius: 16,
          showStepBorder: false,
          steps: <EasyStep>[
            EasyStep(
              customStep: CircleAvatar(
                radius: 16,
                backgroundColor: Palette.greyColor,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: controller.currentStep.value >= 0
                      ? Palette.primaryColor
                      : Palette.greyColor,
                  child: const Text(
                    '1',
                    style: TextStyle(
                        color: Palette.lightColor, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              title: 'Photo',
            ),
            EasyStep(
              customStep: CircleAvatar(
                radius: 16,
                backgroundColor: Palette.greyColor,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: controller.currentStep.value >= 1
                      ? Palette.primaryColor
                      : Palette.greyColor,
                  child: const Text(
                    '2',
                    style: TextStyle(
                        color: Palette.lightColor, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              title: 'Details',
            ),
            EasyStep(
              customStep: CircleAvatar(
                radius: 16,
                backgroundColor: Palette.greyColor,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: controller.currentStep.value >= 2
                      ? Palette.primaryColor
                      : Palette.greyColor,
                  child: const Text(
                    '3',
                    style: TextStyle(
                        color: Palette.lightColor, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              title: 'Ammount',
            ),
          ],
        ));
  }
}
