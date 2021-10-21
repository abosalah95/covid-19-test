import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_provider.dart';

// final String apiUrl = "";
final String apiUrl = "https://sstworkflowmobileapi.azurewebsites.net";

class Repository {
  final apiProvider = ApiProvider();

  /////////////////////////////////////////////////////////////////
  Repository._privateConstructor();

  static final Repository instance = Repository._privateConstructor();

  Future getDate() async {
    var responseData = await apiProvider.getRequestAPI(
      url: 'https://doh.saal.ai/api/live',
      headers: {},
    );
    return responseData;
  }

  }