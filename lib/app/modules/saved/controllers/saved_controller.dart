import 'package:get/get.dart';
import 'package:praktikum/app/data/models/posts.dart';
import 'package:praktikum/app/data/services/service.dart';

class SavedController extends GetxController {
  SavedController({required this.repository});

  final Repository repository;
  final _postsList = <Post>[].obs;

  get postList => _postsList;
  set postList(value) => _postsList.value = value;

  void fetchPost() {
    repository.getAll().then((data) {
      _postsList.value = data;
    });
  }

  @override
  void onInit() {
    fetchPost();
    super.onInit();
  }
}
