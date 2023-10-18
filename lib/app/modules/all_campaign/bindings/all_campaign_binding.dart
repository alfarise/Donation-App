import 'package:get/get.dart';

import '../../controllers.dart';

class AllCampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllCampaignController>(
      () => AllCampaignController(),
    );
  }
}
