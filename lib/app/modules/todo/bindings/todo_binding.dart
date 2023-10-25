import 'package:get/get.dart';

import '../../controllers.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoControlller>(() => TodoControlller());
  }
}
