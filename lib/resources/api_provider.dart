import 'dart:async';
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'custom_exception.dart';




class ApiProvider {


  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal();


  Future<dynamic> getRequestAPI({String url,Map<String, String> headers}) async {
    try {
      print("ApiProvider : $url");
      final response = await http.get(url,);
      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
          print("ApiProvider : Done Send API");
          return data;
      } else {
        throw MyException(
        message: response.body,
          error: response.statusCode,
        );
      }
    } on TimeoutException catch (e) {
      print(e.message);
      throw MyException(
        message: tr('an_error_occurred_please_try_again'),
        error: 101,
      );
    } on SocketException catch (e) {
      print(e.message);
      throw MyException(
        message: tr('please_check_internet_connection'),
        error: 102,
      );
    }
  }


}

