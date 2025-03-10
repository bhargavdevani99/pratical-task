import 'package:boiler_plate/global/config/app_colors.dart';
import 'package:boiler_plate/global/config/image_path.dart';
import 'package:boiler_plate/global/dynamic_size/size_constant.dart';
import 'package:boiler_plate/src/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetWidget<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImagePath.mcLogo,
              height: 64,
              width: 181,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
