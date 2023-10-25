import '../providers/api.dart';

class Repository {
  final ApiClient apiClient;

  Repository({required this.apiClient});

  Future getAll() {
    return apiClient.getAll();
  }

  Future getId(id) {
    return apiClient.getId(id);
  }
}
