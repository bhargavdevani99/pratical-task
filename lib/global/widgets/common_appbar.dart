import 'package:boiler_plate/global/config/app_colors.dart';
import 'package:boiler_plate/global/config/image_path.dart';
import 'package:boiler_plate/global/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar commonAppBar({
  required String title,
  Function()? onTap,
  Color? backgroundColor,
  Color? foregroundColor,
  bool isAction = false,
  List<Widget>? actionWidget,
  textColor,
  bool isCenterTitle = false,
  bool isButtonShow = true,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? AppColors.primary,
    foregroundColor: foregroundColor ?? AppColors.white,
    automaticallyImplyLeading: false,
    leading: isButtonShow
        ? Center(
            child: InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap();
                } else {
                  Get.back();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  ImagePath.backIcon,
                  width: 9.99,
                  height: 16.57,
                  color: textColor ?? AppColors.white,
                ),
              ),
            ),
          )
        : const SizedBox(),
    title: Text(
      title,
      style: AppTextStyle.regular600.copyWith(
        color: textColor ?? AppColors.white,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 20,
      ),
    ),
    centerTitle: isCenterTitle,
    actions: isAction ? actionWidget : [const SizedBox()],
    // elevation: 0.0,
  );
}
