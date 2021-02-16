import 'dart:convert';

import 'package:african_echoes/model/language.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class LanguageApiClient {
  static const baseUrl = "http://173.248.135.167/AfricanEchoes";
  final http.Client httpClient;

  LanguageApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Language>> fetchLanguage() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final languageUrl = "$baseUrl/api/Languages";

    final languageResponse =
        await this.httpClient.get(languageUrl, headers: headers);

    if (languageResponse.statusCode != 200) {
      print(languageResponse.statusCode);
      throw Exception("language failed");
    }

    final languageJson = jsonDecode(languageResponse.body);
    List<Language> languageList = [];
    for (var c in languageJson) {
      languageList.add(Language.fromJson(c));
    }
    return languageList;
  }
}
