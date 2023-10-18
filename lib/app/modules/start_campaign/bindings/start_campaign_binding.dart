import 'package:get/get.dart';

import '../../controllers.dart';

class StartCampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllCampaignController>(() => AllCampaignController());
    Get.lazyPut<StartCampaignController>(() => StartCampaignController());
  }
}
