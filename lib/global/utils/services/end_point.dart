// API EndPoint

import 'package:boiler_plate/global/utils/services/api_response.dart';
import 'package:flutter/foundation.dart';

abstract class EndPoint {
  static dynamic environment = Environment.staging;

  static String baseUrl() {
    if (environment == Environment.staging) {
      return 'https://baseurl/staging';
    } else {
      return 'https://baseurl/production';
    }
  }

  static const signUp = "users/signup";
  static const login = "users/login";
  static const home = "home";
}

devLog(String? data) {
  if (EndPoint.environment == Environment.staging) {
    if (kDebugMode) {
      print(data);
    }
  }
}
