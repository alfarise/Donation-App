import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appwrite/appwrite.dart';

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
    Client client = Client();
    Storage storage = Storage(client);
    Databases databases = Databases(client);
    var imgUrl = '';

    campaignData.value = {
      'imagePath': imagePath,
      'title': title,
      'description': description,
      'amount': amount,
    };

    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6566886e65d78055e452');
    // TODO: Upload with Image
    Future imgUpResult = storage.createFile(
      bucketId: '656f52923d44b8734c45',
      fileId: ID.unique(),
      file: InputFile.fromPath(path: imagePath),
    );

    imgUpResult.then((response) {
      Map<String, dynamic> data = jsonDecode(response);
      String fileId = data['\$id'];
      imgUrl = 'https://cloud.appwrite.io/v1/storage/buckets/656f52923d44b8734c45/files/$fileId/view?project=6566886e65d78055e452&mode=admin`';

      Future upResult = databases.createDocument(
          databaseId: '65668c80f134d5d24f1b',
          collectionId: '65668c9d78e609d1b353',
          documentId: ID.unique(),
          data: {
            'title': title,
            'description': description,
            'imgUrl': imgUrl
          }
      );
      upResult.then((response) {
        Get.snackbar('Success', 'Post Created Successfully');
      });
    }).catchError((error) {
      Get.snackbar('Error', '$error');
    });

    // Future upResult = databases.createDocument(
    //     databaseId: '65668c80f134d5d24f1b',
    //     collectionId: '65668c9d78e609d1b353',
    //     documentId: ID.unique(),
    //     data: {
    //       'title': title.toString(),
    //       'description': description.toString()
    //     },
    // );
    // upResult.then((response) {
    //   Get.snackbar('Success', 'Post Created Successfully');
    // }).catchError((error) {
    //   Get.snackbar('Error', error.response);
    // });

    allCampaignController.campaignStorage.val =
        allCampaignController.addCampaignData(campaignData);
  }
}
