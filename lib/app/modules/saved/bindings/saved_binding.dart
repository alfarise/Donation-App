import 'package:get/get.dart';
import 'package:praktikum/app/data/providers/api.dart';
import 'package:praktikum/app/data/services/service.dart';
import 'package:http/http.dart' as http;

import '../../controllers.dart';

class SavedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedController>(
      () => SavedController(
        repository: Repository(
          apiClient: ApiClient(httpClient: http.Client()),
        ),
      ),
    );
  }
}
