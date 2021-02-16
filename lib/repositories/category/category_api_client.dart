import 'dart:convert';

import 'package:african_echoes/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class CategoryApiClient {
  static const baseUrl = "http://173.248.135.167/AfricanEchoes";
  final http.Client httpClient;

  CategoryApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Category>> fetchCategory() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final categoryUrl = "$baseUrl/api/Category/Categories";

    final categoryResponse =
        await this.httpClient.get(categoryUrl, headers: headers);

    if (categoryResponse.statusCode != 200) {
      print(categoryResponse.statusCode);
      throw Exception("category failed");
    }

    final categoryJson = jsonDecode(categoryResponse.body);
    List<Category> categoryList = [];
    for (var c in categoryJson) {
      categoryList.add(Category.fromJson(c));
    }
    return categoryList;
  }
}
