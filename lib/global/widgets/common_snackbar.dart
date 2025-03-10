import 'package:boiler_plate/global/config/app_colors.dart';
import 'package:boiler_plate/global/dynamic_size/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackbar({
  required String title,
  required String message,
}) {
  ///  title = Success,Warning,Error

  commonSnackBar(
    msg: message,
    backgroundColor: title == "Success"
        ? AppColors.success
        : title == "Warning"
            ? AppColors.orange
            : title == "Error"
                ? AppColors.error
                : AppColors.primary,
  );
}

commonSnackBar({
  required String msg,
  Color backgroundColor = AppColors.primary,
}) {
  double widthGet = Get.width - MySize.getScaledSizeHeight(350);
  IconData iconData = checkIcon(backgroundColor);
  String subText = linkTextShow(backgroundColor);
  Get.snackbar(
    subText,
    msg,
    maxWidth: MySize.getScaledSizeHeight(350),
    snackPosition: SnackPosition.TOP,
    colorText: AppColors.white,
    backgroundColor: backgroundColor,
    borderRadius: MySize.getScaledSizeHeight(6),
    duration: const Duration(milliseconds: 700),
    animationDuration: const Duration(milliseconds: 300),
    barBlur: 20.0,
    messageText: Text(
      msg,
      style: TextStyle(
        fontSize: MySize.size13,
        color: AppColors.white,
      ),
    ),
    titleText: Text(
      subText,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: MySize.size14,
        color: AppColors.white,
      ),
    ),
    isDismissible: false,
    margin: EdgeInsets.only(
      left: widthGet,
      right: MySize.getScaledSizeHeight(20),
      top: MySize.getScaledSizeHeight(25),
    ),
    padding: EdgeInsets.only(
      left: MySize.getScaledSizeHeight(12),
      top: MySize.getScaledSizeHeight(10),
      bottom: MySize.getScaledSizeHeight(10),
    ),
    icon: Icon(
      iconData,
      color: AppColors.white,
      size: MySize.size19,
    ),
    mainButton: TextButton(
      onPressed: () {
        // Your cancel button logic here
        Get.back();
      },
      child: Icon(
        Icons.close_sharp,
        color: AppColors.white,
        size: MySize.size19,
      ),
    ),
  );
}

IconData checkIcon(Color? backgroundColor) {
  return backgroundColor == AppColors.error
      ? Icons.block_flipped
      : backgroundColor == AppColors.primary
          ? Icons.info_outline
          : backgroundColor == AppColors.success
              ? Icons.check_circle_outline_sharp
              : backgroundColor == AppColors.orange
                  ? Icons.warning_amber_sharp
                  : Icons.check_circle_outline_sharp;
}

String linkTextShow(Color? backgroundColor) {
  return backgroundColor == AppColors.error
      ? "Error"
      : backgroundColor == AppColors.primary
          ? "Info"
          : backgroundColor == AppColors.success
              ? "Success"
              : backgroundColor == AppColors.orange
                  ? "Warning"
                  : "Success";
}
