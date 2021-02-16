import 'dart:convert';

import 'package:african_echoes/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class BookApiClient {
  static const baseUrl = "http://173.248.135.167/AfricanEchoes";
  final http.Client httpClient;

  BookApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Book>> fetchBook() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final bookUrl = "$baseUrl/api/Book/Books";

    final bookResponse = await this.httpClient.get(bookUrl, headers: headers);

    if (bookResponse.statusCode != 200) {
      print(bookResponse.statusCode);
      throw Exception("book failed");
    }

    final bookJson = jsonDecode(bookResponse.body);
    List<Book> bookList = [];
    for (var d in bookJson) {
      bookList.add(Book.fromJson(d));
    }

    return bookList;
  }

  Future<List<Book>> fetchBookByCategory({@required int categoryId}) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final bookUrl = "$baseUrl/api/Book/BookByCategory/$categoryId";

    final bookResponse = await this.httpClient.get(bookUrl, headers: headers);

    if (bookResponse.statusCode != 200) {
      print(bookResponse.statusCode);
      throw Exception("book failed");
    }

    final bookJson = jsonDecode(bookResponse.body);
    List<Book> bookList = [];
    for (var d in bookJson) {
      bookList.add(Book.fromJson(d));
    }

    return bookList;
  }

  Future<List<Book>> fetchBookByLanguage({@required int languageId}) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final bookUrl = "$baseUrl/api/Book/BookByLanguage/$languageId";

    final bookResponse = await this.httpClient.get(bookUrl, headers: headers);

    if (bookResponse.statusCode != 200) {
      print(bookResponse.statusCode);
      throw Exception("book failed");
    }

    final bookJson = jsonDecode(bookResponse.body);
    List<Book> bookList = [];
    for (var d in bookJson) {
      bookList.add(Book.fromJson(d));
    }

    return bookList;
  }

  Future<List<Book>> fetchBookByFeaatured() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final bookUrl = "$baseUrl/api/Book/BookByFeautured";

    final bookResponse = await this.httpClient.get(bookUrl, headers: headers);

    if (bookResponse.statusCode != 200) {
      print(bookResponse.statusCode);
      throw Exception("book failed");
    }

    final bookJson = jsonDecode(bookResponse.body);
    List<Book> bookList = [];
    for (var d in bookJson) {
      bookList.add(Book.fromJson(d));
    }

    return bookList;
  }

  Future<List<Book>> fetchBookByNew() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final bookUrl = "$baseUrl/api/Book/BookByNew";

    final bookResponse = await this.httpClient.get(bookUrl, headers: headers);

    if (bookResponse.statusCode != 200) {
      print(bookResponse.statusCode);
      throw Exception("book failed");
    }

    final bookJson = jsonDecode(bookResponse.body);
    List<Book> bookList = [];
    for (var d in bookJson) {
      bookList.add(Book.fromJson(d));
    }

    return bookList;
  }

  Future<List<Book>> fetchBookByTopChart() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final bookUrl = "$baseUrl/api/Book/BookByTopChart";

    final bookResponse = await this.httpClient.get(bookUrl, headers: headers);

    if (bookResponse.statusCode != 200) {
      print(bookResponse.statusCode);
      throw Exception("book failed");
    }

    final bookJson = jsonDecode(bookResponse.body);
    List<Book> bookList = [];
    for (var d in bookJson) {
      bookList.add(Book.fromJson(d));
    }

    return bookList;
  }
}
