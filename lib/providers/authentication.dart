import 'package:dio/dio.dart';
import 'package:adzone/models/user.dart';
import 'package:adzone/utils/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:adzone/models/response.dart';

class AuthenticationApi {
  final Dio _dio = new Dio();
  final storage = new FlutterSecureStorage();

  Future<ResponseModel> login(String email, String password) async {
    try {
      final response = await _dio.post(SERVER_URL + '/auth/signin',
          data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        final token = response.data['token'];
        storage.write(key: 'token', value: token);
        //plug response data into a Response object
        final responseData = ResponseModel.fromJson(response.data);
        return responseData;
      } else {
        final responseData = ResponseModel.fromJson(response.data);
        return responseData;
      }
    } catch (e) {
      // print(e);
      final responseData = ResponseModel.fromJson(e.response.data);
      return responseData;
    }
  }

  Future<ResponseModel> signup(String first_name, String last_name,
      String email, String password) async {
    try {
      final response = await _dio.post(SERVER_URL + '/auth/signup', data: {
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "password": password
      });
      final responseData = ResponseModel.fromJson(response.data);
      return responseData;
    } catch (e) {
      final responseData = ResponseModel.fromJson(e.response.data);
      return responseData;
    }
  }

  Future<String> getToken() async {
    try {
      final token = await storage.read(key: 'token');
      return token;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  Future<User> getUser() async {
    try {
      final token = await storage.read(key: 'token');
      final response = await _dio.get(SERVER_URL + '/auth/user',
          options: Options(headers: {'Authorization': token}));
      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        return user;
      } else {
        throw Exception(response.data['msg']);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> logout() async {
    try {
      storage.delete(key: 'token');
      return "Logout Successful";
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  Future<ResponseModel> verifyAccount(String code) async {
    try {
      final response = await _dio.get(SERVER_URL + '/auth/verify/' + code);

      final responseData = ResponseModel.fromJson(response.data);
      return responseData;
    } catch (e) {
      final responseData = ResponseModel.fromJson(e.response.data);
      return responseData;
    }
  }

  //check user logged in
  Future<bool> isLoggedIn() async {
    try {
      final token = await storage.read(key: 'token');
      if (token != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  //resend verification code
  Future<ResponseModel> resendVerificationCode(String email) async {
    try {
      final response = await _dio.post(SERVER_URL + '/auth/resend-verification',
          data: {"email": email});
      final responseData = ResponseModel.fromJson(response.data);
      return responseData;
    } catch (e) {
      final responseData = ResponseModel.fromJson(e.response.data);
      return responseData;
    }
  }
}
