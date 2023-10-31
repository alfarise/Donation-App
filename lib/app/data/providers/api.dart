import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news.dart';
import '../models/posts.dart';

class ApiClient {
  final String newsApiKey = '947f662c7f024bdf9be2d89594696b5d';
  final String newsApiUrl = 'https://newsapi.org/v2/top-headlines';
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future getAll() async {
    try {
      var response = await httpClient.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<Post> postModel =
            jsonResponse.map((model) => Post.fromJson(model)).toList();
        return postModel;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (_) {}
  }

  Future getId(int id) async {
    try {
      var response = await httpClient.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        // Map<String, dynamic> jsonResponse = json.decode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (_) {}
  }

  Future getTopHeadlines() async {
    try {
      var response = await httpClient.get(Uri.parse(
          '$newsApiUrl?category=health&country=us&pageSize=5&apiKey=$newsApiKey'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var newsModel = News.fromJson(jsonResponse).toJson();
        return newsModel;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (_) {}
  }
}
