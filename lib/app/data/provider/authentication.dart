import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_x/app/core/api.dart';
import 'package:get_x/app/core/urls.dart';

class AuthenticationProvider {
  Dio dio = Dio();
  String url = API().url;

  Future auth(email, password) async {
    Map<String, dynamic> data = {'email': email, 'password': password};

    final response =
        await dio.post('$url${BaseUrls.auth}', data: jsonEncode(data));
    final user = (response.data);
    return user;
  }
}
