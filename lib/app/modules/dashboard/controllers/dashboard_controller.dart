import 'package:get/get.dart';
import 'package:praktikum/app/data/services/service.dart';

class DashboardController extends GetxController {
  DashboardController({required this.repository});

  final Repository repository;
  final currentIndex = 0.obs;
  final _newsList = [].obs;

  get newsList => _newsList;
  set newsList(value) => _newsList.value = value;

  void fetchNews() {
    repository.getTopHeadlines().then((data) {
      _newsList.value = data.articles;
    });
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }
}
