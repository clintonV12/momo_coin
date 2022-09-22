import 'package:dio/dio.dart';
import 'constants.dart';
import 'models/user_model.dart';

class ApiClient {
  final Dio _dio = Dio();

  // Future<Response> registerUser() async {
  //IMPLEMENT USER REGISTRATION
  //}

  Future<Response> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        ApiConstants.baseUrl + ApiConstants.loginEndpoint,
        data: {
          'username': username,
          'password': password,
        },
        queryParameters: {},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response?.data;
    }
  }

  //Future<Response> getUserProfileData() async {
  //GET USER PROFILE DATA
  //}

  //Future<Response> logout() async {
  //IMPLEMENT USER LOGOUT
  //}
}
