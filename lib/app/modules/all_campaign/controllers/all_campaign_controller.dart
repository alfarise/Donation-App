import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:praktikum/app/data/models/campaign.dart';

class AllCampaignController extends GetxController {
  Databases? databases;
  dynamic campaign;
  final box = GetStorage();
  final allCampaignData = [].obs;
  final campaignStorage = [].val('campaigns');

  @override
  void onInit() {
    Client client = Client();
    client.setEndpoint('http://10.0.2.2/v1').setProject('65668fddd2f7242b8716');
    databases = Databases(client);

    // allCampaignData.value = [...campaignStorage.val];
    listAllCampaign();
    super.onInit();
  }

  List addCampaignData(Map<String, String> data) {
    allCampaignData.add(data);

    return allCampaignData;
  }

  void listAllCampaign() {
    Future result = databases!.listDocuments(
      databaseId: '656f23f0db3bae80974a',
      collectionId: '656f244dad54e727440f',
    );

    result.then((response) {
      allCampaignData.value =
          response.documents.map((d) => Campaign.fromJson(d.data)).toList();
      print('Data:: ${allCampaignData[0].id}');
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

  void getCampaign(String id) {
    Future result = databases!.getDocument(
      databaseId: '656f23f0db3bae80974a',
      collectionId: '656f244dad54e727440f',
      documentId: id,
    );

    result.then((response) {
      campaign = response.data;
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

  void deleteCampaign(String id) {
    Future result = databases!.deleteDocument(
      databaseId: '656f23f0db3bae80974a',
      collectionId: '656f244dad54e727440f',
      documentId: id,
    );

    result.then((response) {
      listAllCampaign();
      print('Data:: $response');
      Get.snackbar(
        'Success',
        'Delete successful',
      );
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
