import 'dart:developer';

import 'package:http/http.dart' as http;
import 'constants.dart';
import 'models/user_model.dart';

class ApiService {
  Future<List<UserModel>?> getAuths(username, password) async {
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      List<UserModel> _model = userModelFromJson(response.body);
      return _model;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return null;
    }
  }

  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
