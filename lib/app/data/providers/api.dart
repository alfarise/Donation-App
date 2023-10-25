import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/posts.dart';

class ApiClient {
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
      } else
        print('error');
    } catch (_) {}
  }

  Future getId(int id) async {
    try {
      var response = await httpClient.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        // Map<String, dynamic> jsonResponse = json.decode(response.body);
      } else
        print('erro -get');
    } catch (_) {}
  }
}
