import 'package:adzone/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:adzone/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileApi {
  final Dio _dio = new Dio();
  final storage = new FlutterSecureStorage();
  final ServerUrl = SERVER_URL + "/api/profile/";
  Future<User> getUser() async {
    try {
      // final token = await storage.read(key: 'token');
      final response = await _dio.get(ServerUrl,
          options: Options(headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MmQ3ZGJmZGUxNDRhNjlmZWFhM2Q2N2EiLCJpYXQiOjE2NTk1NTIyMzQzOTcsImV4cCI6MTY1OTU1MzQ0Mzk5N30.RUjmbEf_vSr6FG_tGPZ2hFxKJmwl9QQI298MmGEEZiw'
          }));
      if (response.statusCode == 200) {
        print(response.data['email']);
        final user = User.fromJson(response.data);
        print(user);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
