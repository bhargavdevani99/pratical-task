import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? windowsDesktop;
  final Widget? webDesktop;
  final Widget? macDesktop;
  final Widget? linuxDesktop;

  const Responsive({
    super.key,
   required this.mobile,
   this.tablet,
   this.windowsDesktop,
   this.webDesktop,
   this.macDesktop,
   this.linuxDesktop,
  });

  static bool isMobile() => Get.width < 400;

  static bool isTablet() => Get.width < 1100 && Get.width >= 400;

  static bool isWindowsDesktop() => !kIsWeb && Get.width>=1100 && Platform.isWindows;

  static bool isWebDesktop() => Get.width>=1100?true:false;

  static bool isMacDesktop()=> Get.width>=1100 && Platform.isMacOS;

  static bool isLinuxDesktop() => Get.width>=1100 && Platform.isLinux;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(isWindowsDesktop()){
        return windowsDesktop??desktopFallback();
      }else if(isWebDesktop()){
        return webDesktop?? desktopFallback();
      }else if(isMacDesktop()){
        return macDesktop??desktopFallback();
      }else if(isLinuxDesktop()){
        return linuxDesktop??desktopFallback();
      }else if(constraints.maxWidth>=850 && tablet!=null){
        return tablet!;
      }else{
        return mobile!;
      }
    });
  }
}

Widget desktopFallback() {
  return const SizedBox.shrink();
}
