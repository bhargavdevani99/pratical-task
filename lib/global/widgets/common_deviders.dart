import 'package:boiler_plate/global/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

commonDivider({
  EdgeInsetsGeometry? margin,
  double? height,
  Color? color,
  double? width,
}) {
  return Container(
    margin: margin,
    height: height ?? 0.5,
    width: width ?? 0.5,
    color: color ?? AppColors.grey,
  );
}
