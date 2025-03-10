
import 'dart:async';
import 'package:boiler_plate/global/utils/shared_preference_utils.dart';
import 'package:boiler_plate/src/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(
        seconds: 2,
      ),
      () async {
        var isLogin = PreferenceManagerUtils.getIsLogin();

        if (isLogin.isNotEmpty) {
          Get.offAllNamed(
            Routes.HOME_SCREEN,
          );
        } else {
          Get.offAllNamed(
            Routes.HOME_SCREEN,
          );
        }
      },
    );
  }
}
