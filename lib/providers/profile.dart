import 'dart:io';

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
      final token = await storage.read(key: 'token');
      final response = await _dio.get(ServerUrl,
          options: Options(headers: {'Authorization': token}));
      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  //update avatar image
  Future<User> updateAvatar(File image) async {
    try {
      final token = await storage.read(key: 'token');
      final response = await _dio.post(ServerUrl + "updateAvatar",
          options: Options(headers: {
            'Authorization': token,
          }),
          data: FormData.fromMap({
            'avatar':
                await MultipartFile.fromFile(image.path, filename: 'avatar.jpg')
          }));
      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
