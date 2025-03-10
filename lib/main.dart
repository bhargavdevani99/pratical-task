import 'package:boiler_plate/global/config/app_colors.dart';
import 'package:boiler_plate/global/config/app_string.dart';
import 'package:boiler_plate/global/utils/services/api_response.dart';
import 'package:boiler_plate/global/utils/services/end_point.dart';
import 'package:boiler_plate/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // Environment Control System
  EndPoint.environment = Environment.staging;

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale(
        'en',
        'US',
      ),
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: AppColors.white,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
