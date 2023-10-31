import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/core/core.dart';
import 'package:praktikum/routes/app_pages.dart';

import '../controllers/start_campaign_controller.dart';
import 'widgets/widgets.dart';
import 'fragments/fragments.dart';

class StartCampaignView extends GetView<StartCampaignController> {
  const StartCampaignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavbarWidget(),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          const StepperWidget(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Obx(() => IndexedStack(
                        index: controller.currentStep.value,
                        children: const <Widget>[
                          PhotoFragment(),
                          DetailsFragment(),
                          AmountFragment(),
                        ],
                      )),
                  TextButton(
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
                    onPressed: () {
                      if (controller.currentStep.value == 2) {
                        controller.addNewCampaign(
                          imagePath: controller.imagePath.value,
                          title: controller.titleController.text,
                          description: controller.detailsController.text,
                          amount: controller.amountController.text,
                        );
                        Get.offNamed(Routes.DASHBOARD);
                        return;
                      }
                      controller.nextStep();
                    },
                    child: Obx(() => controller.currentStep.value < 2
                        ? const Text('Continue')
                        : const Text('Done')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
