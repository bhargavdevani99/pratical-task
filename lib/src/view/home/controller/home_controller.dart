import 'package:boiler_plate/global/config/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxInt bottomIndex = 0.obs;

  RxList tabList = [
    'Profile',
    'Inventory',
    'All Posts',
    'Job Posts',
  ].obs;
  RxInt selectTabIndex = 0.obs;

  final ScrollController businessScrollController = ScrollController();
  final ScrollController productScrollController = ScrollController();
  final ScrollController similarStoreScrollController = ScrollController();
  RxList businessImageList = [
    ImagePath.businessImg1,
    ImagePath.businessImg2,
    ImagePath.businessImg3,
    ImagePath.businessImg1,
    ImagePath.businessImg2,
    ImagePath.businessImg3,
  ].obs;

  RxInt selectFilterTabIndex = 0.obs;
  RxList filterList = [
    'Products',
    'Services',
  ].obs;

  RxList productList = [
    ImagePath.productImg1,
    ImagePath.productImg2,
    ImagePath.productImg3,
    ImagePath.productImg1,
    ImagePath.productImg2,
    ImagePath.productImg3,
  ].obs;
}
