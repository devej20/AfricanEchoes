import 'dart:convert';

import 'package:african_echoes/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class BookImageApiClient {
  static const baseUrl = "http://173.248.135.167/AfricanEchoes";

  final http.Client httpClient;

  BookImageApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<BookImage>> fetchBookImage() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final bookImageUrl = "$baseUrl/api/BookImage/BookImages";

    final bookImageResponse =
        await this.httpClient.get(bookImageUrl, headers: headers);

    if (bookImageResponse.statusCode != 200) {
      print(bookImageResponse.statusCode);
      throw Exception("bookImage failed");
    }

    final responseJson = jsonDecode(bookImageResponse.body);
    List<BookImage> bookImageList = [];
    for (var d in responseJson) {
      bookImageList.add(BookImage.fromJson(d));
    }
    return bookImageList;
  }
}
