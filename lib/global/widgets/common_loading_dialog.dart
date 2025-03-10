import 'package:boiler_plate/global/config/image_path.dart';
import 'package:boiler_plate/global/dynamic_size/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoadingDialog() {
  Future.delayed(
    Duration.zero,
    () {
      Get.dialog(
        Center(
          child: Material(
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MySize.getScaledSizeHeight(50),
                  width: MySize.getScaledSizeHeight(50),
                  child: CircularProgressIndicator(
                    strokeWidth: MySize.getScaledSizeWidth(1.3),
                    color: Colors.white,
                    valueColor: const AlwaysStoppedAnimation(
                      Colors.white,
                    ),
                  ),
                ),
                Image.asset(
                  ImagePath.mcLogo,
                  height: MySize.getScaledSizeHeight(40),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: true,
      );
    },
  );
}

void hideLoadingDialog() {
  if (Get.isDialogOpen.toString() == "true") {
    Get.back();
  }
}
