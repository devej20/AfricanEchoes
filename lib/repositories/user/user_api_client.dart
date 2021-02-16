import 'dart:convert';

import 'package:african_echoes/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class UserApiClient {
  static const baseUrl = "http://173.248.135.167/AfricanEchoes";
  final http.Client httpClient;

  UserApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<User> login({
    @required String phoneNumber,
    @required String password,
  }) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final loginUrl = "$baseUrl/api/User/Authenticate";
    final body =
        jsonEncode({"phoneNumber": "$phoneNumber", "password": "$password"});

    final loginResponse =
        await this.httpClient.post(loginUrl, headers: headers, body: body);

    if (loginResponse.statusCode != 200) {
      print(loginResponse.statusCode);
      throw Exception("Login failed, Please check Phone number or Password");
    }

    final responseJson = jsonDecode(loginResponse.body);
    var userJson = responseJson["model"];
    var user = User.fromJson(userJson);
    return user;
  }

  Future<void> register({
    @required String firstName,
    @required String lastName,
    @required String phoneNumber,
    @required String password,
  }) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "firstName": "$firstName",
      "lastName": "$lastName",
      "phoneNumber": "$phoneNumber",
      "password": "$password",
    });
    final registernUrl = "$baseUrl/api/User/Register";

    final registerResponse =
        await this.httpClient.post(registernUrl, headers: headers, body: body);

    final responseJson = jsonDecode(registerResponse.body);
    if (registerResponse.statusCode != 200) {
      String errorMsg = responseJson["errorMessage"];
      throw Exception(errorMsg);
    }

    // ignore: unused_local_variable
    var user = responseJson["model"];
  }
}
