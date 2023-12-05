import 'package:get/get.dart';
import 'package:praktikum/app/data/services/service.dart';
import 'package:appwrite/appwrite.dart';

import '../../controllers.dart';

class DashboardController extends GetxController {
  DashboardController({required this.repository});

  final Repository repository;
  final currentIndex = 0.obs;
  final _newsList = [].obs;
  final loginController = Get.find<LoginController>();

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

  void main() {
    Client client = Client();
    Databases databases = Databases(client);

    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6566886e65d78055e452');

    Future result = databases.listDocuments(
        databaseId: '65668c80f134d5d24f1b',
        collectionId: '65668c9d78e609d1b353');

    result;
  }

  @override
  void onInit() {
    fetchNews();
    main();
    super.onInit();
  }
}
