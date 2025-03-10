import 'package:boiler_plate/global/config/app_colors.dart';
import 'package:boiler_plate/global/config/text_style.dart';
import 'package:flutter/material.dart';

commonButton({
  required String title,
  dynamic onTap,
  double? height,
  double? width,
  EdgeInsets? padding,
  EdgeInsets? margin,
  TextStyle? textStyle,
  Color? color,
  double? borderRadius,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: margin,
      padding: padding,
      height: height ?? 44,
      width: width,
      decoration: BoxDecoration(
        color: color ?? AppColors.red,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: textStyle ??
            AppTextStyle.regular600.copyWith(
              fontSize: 18,
              color: Colors.white,
            ),
      ),
    ),
  );
}
