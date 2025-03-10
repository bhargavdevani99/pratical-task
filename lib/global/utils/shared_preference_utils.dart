

import 'package:get_storage/get_storage.dart';

class PreferenceManagerUtils {
  static GetStorage getStorage = GetStorage();
  static String isLogin = "is_login";
  static String token = "token";

  ///login
  static Future setIsLogin(String value) async {
    await getStorage.write(isLogin, value);
  }

  static String getIsLogin() {
    return getStorage.read(isLogin) ?? '';
  }

  ///token
  static Future setToken(String value) async {
    await getStorage.write(token, value);
  }

  static String getToken() {
    return getStorage.read(token) ?? '';
  }
}
