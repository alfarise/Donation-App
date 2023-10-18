import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../all_campaign/controllers/all_campaign_controller.dart';

class StartCampaignController extends GetxController {
  final currentStep = 0.obs;
  final imagePath = ''.obs;
  final titleController = TextEditingController();
  final detailsController = TextEditingController();
  final amountController = TextEditingController();
  final campaignData = <String, String>{}.obs;
  final allCampaignController = Get.find<AllCampaignController>();

  @override
  void onClose() {
    titleController.dispose();
    detailsController.dispose();
    amountController.dispose();
    super.onClose();
  }

  void nextStep() {
    currentStep.value++;
  }

  Future pickImage(ImageSource imageSource) async {
    final imageFile = await ImagePicker().pickImage(source: imageSource);
    if (imageFile == null) return;
    imagePath.value = imageFile.path;
  }

  void addNewCampaign({
    required String imagePath,
    required String title,
    required String description,
    required String amount,
  }) {
    campaignData.value = {
      'imagePath': imagePath,
      'title': title,
      'description': description,
      'amount': amount,
    };

    allCampaignController.campaignStorage.val =
        allCampaignController.addCampaignData(campaignData);
  }
}
