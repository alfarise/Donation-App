import 'package:get/get.dart';

import '../../controllers.dart';

class TodosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodosControlller>(() => TodosControlller());
  }
}