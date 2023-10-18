import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AllCampaignController extends GetxController {
  final box = GetStorage();
  final allCampaignData = [].obs;
  final campaignStorage = [].val('campaigns');

  @override
  void onInit() {
    super.onInit();
    allCampaignData.value = [...campaignStorage.val];
  }

  List addCampaignData(Map<String, String> data) {
    allCampaignData.add(data);

    return allCampaignData;
  }
}
