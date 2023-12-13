import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:praktikum/app/data/models/news.dart';
import 'package:praktikum/app/data/providers/api.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client, ApiClient])
void main() {
  const String newsApiKey = '947f662c7f024bdf9be2d89594696b5d';
  const String newsApiUrl = 'https://newsapi.org/v2/top-headlines';
  late ApiClient apiClient;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiClient = ApiClient(httpClient: http.Client());
  });

  group('ApiService', () {
    test('fetchArticles returns a list of news if response is successful',
        () async {
      // Mock the HTTP response for successful case
      when(
        mockClient.get(
          Uri.parse(
              '$newsApiUrl?category=health&country=us&pageSize=5&apiKey=$newsApiKey'),
        ),
      ).thenAnswer((_) async =>
          http.Response('{"articles": []}', 200)); // Mock the HTTP response
      final news = await apiClient.getTopHeadlines();
      // Expect the fetched data to be a list of Article objects
      expect(news, isA<News>());
    });
  });
}
