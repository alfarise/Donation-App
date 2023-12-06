import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../all_campaign/controllers/all_campaign_controller.dart';

class StartCampaignController extends GetxController {
  Databases? databases;
  Storage? storage;
  String? id;
  dynamic campaign;

  final currentStep = 0.obs;
  final imagePath = ''.obs;
  final titleController = TextEditingController();
  final detailsController = TextEditingController();
  final amountController = TextEditingController();
  final campaignData = <String, String>{}.obs;
  final allCampaignController = Get.find<AllCampaignController>();

  @override
  void onInit() {
    super.onInit();
    Client client = Client();
    client.setEndpoint('http://10.0.2.2/v1').setProject('65668fddd2f7242b8716');
    databases = Databases(client);
    storage = Storage(client);

    id = Get.arguments;
    if (id != null) {
      Future result = databases!.getDocument(
        databaseId: '656f23f0db3bae80974a',
        collectionId: '656f244dad54e727440f',
        documentId: id!,
      );

      result.then((response) {
        campaign = response.data;
        editCampaign(campaign);
      }).catchError((error) {
        Get.defaultDialog(
          title: 'Error Database',
          titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
          titleStyle: Get.context?.theme.textTheme.titleLarge,
          content: Text(
            '$error',
            style: Get.context?.theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
        );
      });
    }
  }

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

  void editCampaign(dynamic campaign) {
    titleController.text = campaign['title'];
    detailsController.text = campaign['description'];
    amountController.text = campaign['amount'].toString();
    imagePath.value = campaign['imagePath'];
  }

  Future storeCampaign(Map map) async {
    try {
      await databases!.createDocument(
        databaseId: '656f23f0db3bae80974a',
        documentId: ID.unique(),
        collectionId: '656f244dad54e727440f',
        data: map,
      );
      await storeImage();
      print('StartCampaignController:: storeCampaign $databases');
      Get.snackbar(
        'Success',
        'Create successful',
      );
    } catch (error) {
      Get.defaultDialog(
        title: 'Error Database',
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          '$error',
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future updateCampaign(Map map) async {
    try {
      await databases!.updateDocument(
        databaseId: '656f23f0db3bae80974a',
        documentId: id!,
        collectionId: '656f244dad54e727440f',
        data: map,
      );
      await storeImage();
      allCampaignController.listAllCampaign();
      print('StartCampaignController:: updateCampaign $databases');
      Get.snackbar(
        'Success',
        'Update successful',
      );
    } catch (error) {
      Get.defaultDialog(
        title: 'Error Database',
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          '$error',
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future storeImage() async {
    try {
      final result = await storage!.createFile(
        bucketId: '656f496ed30258311feb',
        fileId: ID.unique(),
        file: InputFile.fromPath(
          path: imagePath.value,
        ),
      );
      print('StorageController:: storeImage $result');
    } catch (error) {
      Get.defaultDialog(
        title: 'Error Storage',
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          '$error',
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}
