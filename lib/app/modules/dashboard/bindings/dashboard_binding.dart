import 'package:get/get.dart';
import 'package:praktikum/app/data/providers/api.dart';
import 'package:praktikum/app/data/services/service.dart';
import 'package:http/http.dart' as http;

import '../../controllers.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(
        repository: Repository(
          apiClient: ApiClient(httpClient: http.Client()),
        ),
      ),
    );
    Get.lazyPut<SavedController>(
      () => SavedController(
        repository: Repository(
          apiClient: ApiClient(httpClient: http.Client()),
        ),
      ),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
