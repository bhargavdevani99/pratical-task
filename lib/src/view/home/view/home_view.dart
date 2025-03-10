import 'package:boiler_plate/global/config/app_colors.dart';
import 'package:boiler_plate/global/config/app_string.dart';
import 'package:boiler_plate/global/config/image_path.dart';
import 'package:boiler_plate/global/config/text_style.dart';
import 'package:boiler_plate/global/dynamic_size/size_constant.dart';
import 'package:boiler_plate/global/widgets/common_appbar.dart';
import 'package:boiler_plate/src/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return GetBuilder(
      init: HomeController(),
      builder: (homeController) {
        return Scaffold(
          backgroundColor: AppColors.black17212A,
          appBar: commonAppBar(
            title: 'Business Profile',
            backgroundColor: AppColors.black17212A,
            isCenterTitle: true,
            isAction: true,
            actionWidget: [
              Padding(
                padding: EdgeInsets.only(
                  right: MySize.getScaledSizeWidth(10),
                ),
                child: const Icon(Icons.more_vert_outlined),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MySize.getScaledSizeWidth(16),
                    top: MySize.getScaledSizeHeight(20),
                    right: MySize.getScaledSizeWidth(16),
                    bottom: MySize.getScaledSizeHeight(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MySize.getScaledSizeHeight(50),
                        child: ListView.builder(
                          itemCount: homeController.tabList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final res = homeController.tabList[index];
                            return GestureDetector(
                              onTap: () {
                                homeController.selectTabIndex.value = index;
                                homeController.update();
                              },
                              child: Container(
                                width: MySize.getScaledSizeWidth(73.5),
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  top: MySize.getScaledSizeHeight(10),
                                  bottom: MySize.getScaledSizeHeight(18),
                                  left: MySize.getScaledSizeWidth(
                                      index == 0 ? 0 : 8),
                                ),
                                // padding: EdgeInsets.symmetric(
                                //   horizontal: MySize.getScaledSizeWidth(20.75),
                                //   // vertical: MySize.getScaledSizeHeight(8),
                                // ),
                                decoration: BoxDecoration(
                                  color: homeController.selectTabIndex.value ==
                                          index
                                      ? AppColors.primary09A8D3
                                      : AppColors.transparent,
                                  borderRadius: BorderRadius.circular(
                                    MySize.getScaledSizeHeight(19),
                                  ),
                                  border: Border.all(
                                    color:
                                        homeController.selectTabIndex.value ==
                                                index
                                            ? AppColors.primary09A8D3
                                            : AppColors.white,
                                  ),
                                ),
                                child: Text(
                                  res,
                                  style: AppTextStyle.regular600.copyWith(
                                    fontSize: MySize.getScaledSizeHeight(10),
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MySize.getScaledSizeHeight(30),
                          bottom: MySize.getScaledSizeHeight(28),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              ImagePath.mcLogo,
                              height: MySize.getScaledSizeHeight(70),
                              width: MySize.getScaledSizeWidth(70),
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: MySize.getScaledSizeWidth(16),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          AppString.mcDonalds,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              AppTextStyle.regular500.copyWith(
                                            fontSize:
                                                MySize.getScaledSizeHeight(20),
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              MySize.getScaledSizeWidth(10),
                                          vertical:
                                              MySize.getScaledSizeHeight(3),
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            MySize.getScaledSizeHeight(12),
                                          ),
                                          border: Border.all(
                                            width:
                                                MySize.getScaledSizeWidth(0.5),
                                            color: AppColors.yellowFFC300,
                                          ),
                                        ),
                                        child: Text(
                                          AppString.restaurant,
                                          style:
                                              AppTextStyle.regular600.copyWith(
                                            fontSize:
                                                MySize.getScaledSizeHeight(10),
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MySize.getScaledSizeHeight(11),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        ImagePath.locationIcon,
                                        height: MySize.getScaledSizeHeight(20),
                                        width: MySize.getScaledSizeWidth(20),
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(
                                        width: MySize.getScaledSizeWidth(10),
                                      ),
                                      Expanded(
                                        child: Text(
                                          AppString.productSummery,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              AppTextStyle.regular400.copyWith(
                                            fontSize:
                                                MySize.getScaledSizeHeight(10),
                                            color: AppColors.grey9B9B9B,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MySize.getScaledSizeHeight(19),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical:
                                                  MySize.getScaledSizeHeight(8),
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.primary09A8D3,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                MySize.getScaledSizeHeight(12),
                                              ),
                                              border: Border.all(
                                                color: AppColors.primary09A8D3,
                                                width:
                                                    MySize.getScaledSizeHeight(
                                                        1),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: FittedBox(
                                              child: Text(
                                                AppString.follow,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyle.regular600
                                                    .copyWith(
                                                  fontSize: MySize
                                                      .getScaledSizeHeight(12),
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MySize.getScaledSizeWidth(10),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical:
                                                  MySize.getScaledSizeHeight(8),
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                MySize.getScaledSizeHeight(12),
                                              ),
                                              border: Border.all(
                                                color: AppColors.primary09A8D3,
                                                width:
                                                    MySize.getScaledSizeHeight(
                                                        1),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: FittedBox(
                                              child: Text(
                                                AppString.chat,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyle.regular600
                                                    .copyWith(
                                                  fontSize: MySize
                                                      .getScaledSizeHeight(12),
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: MySize.getScaledSizeHeight(23.05),
                          // vertical: MySize.getScaledSizeHeight(8),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            MySize.getScaledSizeHeight(20),
                          ),
                          color: AppColors.black1D2935,
                        ),
                        child: Column(
                          children: [
                            Text(
                              AppString.rateOurBusiness,
                              style: AppTextStyle.regular600.copyWith(
                                fontSize: MySize.getScaledSizeHeight(14),
                                color: AppColors.yellowFFC300,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: MySize.getScaledSizeHeight(13),
                                // vertical: MySize.getScaledSizeHeight(8),
                              ),
                              child: StarRating(
                                onRatingChanged: (rating) {
                                  print('User selected rating: $rating');
                                },
                              ),
                            ),
                            SizedBox(
                              height: MySize.getScaledSizeHeight(10),
                            ),
                            Text(
                              "0 Rated- View Ratings",
                              style: AppTextStyle.regular500.copyWith(
                                fontSize: MySize.getScaledSizeHeight(10),
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MySize.getScaledSizeHeight(12),
                          bottom: MySize.getScaledSizeHeight(38),
                        ),
                        child: Row(
                          children: [
                            commonUnderRatingButton(
                                AppString.shareVisitingCard),
                            SizedBox(
                              width: MySize.getScaledSizeWidth(6),
                            ),
                            commonUnderRatingButton(AppString.shareProfile),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppString.aboutOurBusiness,
                              style: AppTextStyle.regular500.copyWith(
                                fontSize: MySize.getScaledSizeHeight(16),
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Image.asset(
                            color: AppColors.white,
                            height: MySize.getScaledSizeHeight(9),
                            width: MySize.getScaledSizeWidth(12.26),
                            ImagePath.normalArrowRightIcon,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MySize.getScaledSizeHeight(11),
                          bottom: MySize.getScaledSizeHeight(20),
                        ),
                        child: Text(
                          AppString.aboutOurBusinessSummery,
                          style: AppTextStyle.regular400.copyWith(
                            fontSize: MySize.getScaledSizeHeight(10),
                            color: AppColors.grey9B9B9B,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: MySize.getScaledSizeHeight(17),
                          // vertical: MySize.getScaledSizeHeight(8),
                        ),
                        margin: EdgeInsets.only(
                          bottom: MySize.getScaledSizeHeight(20),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            MySize.getScaledSizeHeight(20),
                          ),
                          color: AppColors.black1D2935,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MySize.getScaledSizeWidth(30),
                                // vertical: MySize.getScaledSizeHeight(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  commonAboutBusinessRow(
                                    ImagePath.selectStarImg,
                                    "4.5",
                                  ),
                                  SizedBox(
                                    height: MySize.getScaledSizeHeight(24),
                                    child: VerticalDivider(
                                      color: AppColors.white.withValues(
                                        alpha: 0.58,
                                      ),
                                    ),
                                  ),
                                  commonAboutBusinessRow(
                                    ImagePath.eyesImg,
                                    "100+",
                                  ),
                                  SizedBox(
                                    height: MySize.getScaledSizeHeight(24),
                                    child: VerticalDivider(
                                      color: AppColors.white.withValues(
                                        alpha: 0.58,
                                      ),
                                    ),
                                  ),
                                  commonAboutBusinessRow(
                                    ImagePath.messageImg,
                                    "50+",
                                  ),
                                  SizedBox(
                                    height: MySize.getScaledSizeHeight(24),
                                    child: VerticalDivider(
                                      color: AppColors.white.withValues(
                                        alpha: 0.58,
                                      ),
                                    ),
                                  ),
                                  commonAboutBusinessRow(
                                    ImagePath.personImg,
                                    "50+",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MySize.getScaledSizeHeight(14),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MySize.getScaledSizeWidth(40),
                                // vertical: MySize.getScaledSizeHeight(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Since 1980",
                                    style: AppTextStyle.regular400.copyWith(
                                      fontSize: MySize.getScaledSizeHeight(10),
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Text(
                                    "Joined At : 1/1/2024",
                                    style: AppTextStyle.regular400.copyWith(
                                      fontSize: MySize.getScaledSizeHeight(10),
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Text(
                                    "Posts : 31",
                                    style: AppTextStyle.regular400.copyWith(
                                      fontSize: MySize.getScaledSizeHeight(10),
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 165,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: MySize.getScaledSizeHeight(14),
                    // vertical: MySize.getScaledSizeHeight(8),
                  ),
                  margin: EdgeInsets.only(
                    bottom: MySize.getScaledSizeHeight(14),
                  ),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(
                    //   MySize.getScaledSizeHeight(20),
                    // ),
                    color: AppColors.black1D2935.withValues(alpha: 0.5),
                  ),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      ListView.builder(
                        controller: homeController.businessScrollController,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                          left: MySize.getScaledSizeWidth(17),
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final res = homeController.businessImageList[
                              index % homeController.businessImageList.length];
                          return Padding(
                            padding: EdgeInsets.only(
                              left:
                                  index == 0 ? 0 : MySize.getScaledSizeWidth(5),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                MySize.getScaledSizeHeight(5),
                              ),
                              child: Image.asset(
                                res,
                                width: MySize.getScaledSizeWidth(106),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          double scrollAmount = (MySize.getScaledSizeWidth(106) + MySize.getScaledSizeWidth(5)) *
                              4; // Scroll by three images
                          homeController.businessScrollController.animateTo(
                            homeController.businessScrollController.offset + scrollAmount,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: MySize.getScaledSizeWidth(22),
                          ),
                          child: Container(
                            color: AppColors.transparent,
                            child: Image.asset(
                              height: MySize.getScaledSizeHeight(19),
                              width: MySize.getScaledSizeWidth(19),
                              ImagePath.arrowRight,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MySize.getScaledSizeWidth(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.businessLocationHere,
                        style: AppTextStyle.regular500.copyWith(
                          fontSize: MySize.getScaledSizeHeight(16),
                          color: AppColors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MySize.getScaledSizeHeight(15),
                        ),
                        child: Image.asset(
                          width: double.infinity,
                          ImagePath.googleMapImg,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: MySize.getScaledSizeHeight(27),
                    bottom: MySize.getScaledSizeHeight(25),
                  ),
                  margin: EdgeInsets.only(
                    top: MySize.getScaledSizeHeight(31),
                    bottom: MySize.getScaledSizeHeight(14),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.black1D2935.withValues(alpha: 0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MySize.getScaledSizeHeight(65),
                        child: ListView.builder(
                          itemCount: homeController.filterList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                            horizontal: MySize.getScaledSizeWidth(16),
                          ),
                          itemBuilder: (context, index) {
                            final res = homeController.filterList[index];
                            return GestureDetector(
                              onTap: () {
                                homeController.selectFilterTabIndex.value =
                                    index;
                                homeController.update();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  top: MySize.getScaledSizeHeight(10),
                                  bottom: MySize.getScaledSizeHeight(18),
                                  left: MySize.getScaledSizeWidth(
                                      index == 0 ? 0 : 8),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: MySize.getScaledSizeWidth(20.75),
                                  // vertical: MySize.getScaledSizeHeight(8),
                                ),
                                decoration: BoxDecoration(
                                  color: homeController
                                              .selectFilterTabIndex.value ==
                                          index
                                      ? AppColors.primary09A8D3
                                      : AppColors.black1D2935,
                                  borderRadius: BorderRadius.circular(
                                    MySize.getScaledSizeHeight(19),
                                  ),
                                ),
                                child: Text(
                                  res,
                                  style: AppTextStyle.regular600.copyWith(
                                    fontSize: MySize.getScaledSizeHeight(10),
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 149,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            ListView.builder(
                              controller: homeController.productScrollController,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                left: MySize.getScaledSizeWidth(16),
                              ),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final res = homeController.productList[
                                    index % homeController.productList.length];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0
                                        ? 0
                                        : MySize.getScaledSizeWidth(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      MySize.getScaledSizeHeight(6),
                                    ),
                                    child: Image.asset(
                                      res,
                                      width: MySize.getScaledSizeHeight(116),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                double imageWidth = MySize.getScaledSizeHeight(116); // Image width
                                double padding = MySize.getScaledSizeWidth(5); // Padding between images
                                double scrollAmount = (imageWidth + padding) * 3; // Scroll by 3 images

                                homeController.productScrollController.animateTo(
                                  homeController.productScrollController.offset + scrollAmount,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                  right: MySize.getScaledSizeWidth(22),
                                ),
                                color: AppColors.transparent,
                                child: Image.asset(
                                  height: MySize.getScaledSizeHeight(19),
                                  width: MySize.getScaledSizeWidth(19),
                                  ImagePath.arrowRight,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MySize.getScaledSizeWidth(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppString.similarStores,
                              style: AppTextStyle.regular500.copyWith(
                                fontSize: MySize.getScaledSizeHeight(16),
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                AppString.viewAll,
                                style: AppTextStyle.regular500.copyWith(
                                  fontSize: MySize.getScaledSizeHeight(10),
                                  color: AppColors.primary00A0E6,
                                ),
                              ),
                              SizedBox(
                                width: MySize.getScaledSizeWidth(13),
                              ),
                              Image.asset(
                                height: MySize.getScaledSizeHeight(9),
                                width: MySize.getScaledSizeWidth(12.26),
                                ImagePath.normalArrowRightIcon,
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MySize.getScaledSizeHeight(20),
                          bottom: MySize.getScaledSizeHeight(18),
                        ),
                        child: SizedBox(
                          height: 175,
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              ListView.builder(
                                controller: homeController.similarStoreScrollController,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 220,
                                    margin: EdgeInsets.only(
                                      right: MySize.getScaledSizeWidth(10),
                                    ),
                                    padding: EdgeInsets.only(
                                      top: MySize.getScaledSizeHeight(11),
                                      bottom: MySize.getScaledSizeHeight(13),
                                      left: MySize.getScaledSizeWidth(13),
                                      right: MySize.getScaledSizeWidth(13),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        MySize.getScaledSizeHeight(12),
                                      ),
                                      color: AppColors.black1D2935,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          // height: 108,
                                          // width: 188,
                                          ImagePath.storeImg,
                                        ),
                                        SizedBox(
                                          height: MySize.getScaledSizeHeight(8),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              height: 25,
                                              width: 25,
                                              ImagePath.storeLogoImg,
                                            ),
                                            SizedBox(
                                              width:
                                                  MySize.getScaledSizeWidth(4),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Burger King",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: AppTextStyle
                                                        .regular600
                                                        .copyWith(
                                                      fontSize: MySize
                                                          .getScaledSizeHeight(
                                                              10),
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "4.5",
                                                        style: AppTextStyle
                                                            .regular500
                                                            .copyWith(
                                                          fontSize: MySize
                                                              .getScaledSizeHeight(
                                                                  8),
                                                          color: AppColors
                                                              .yellowFFC300,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MySize
                                                            .getScaledSizeHeight(
                                                                2),
                                                      ),
                                                      Image.asset(
                                                        color: AppColors
                                                            .yellowFFC300,
                                                        height: 8,
                                                        width: 8,
                                                        ImagePath.selectStarImg,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MySize.getScaledSizeWidth(
                                                        14),
                                                vertical:
                                                    MySize.getScaledSizeHeight(
                                                        6),
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.primary09A8D3,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  MySize.getScaledSizeHeight(
                                                      12),
                                                ),
                                                border: Border.all(
                                                  color:
                                                      AppColors.primary09A8D3,
                                                  width: MySize
                                                      .getScaledSizeHeight(1),
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                AppString.contactUs,
                                                style: AppTextStyle.regular600
                                                    .copyWith(
                                                  fontSize: MySize
                                                      .getScaledSizeHeight(6),
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  double spacing = MySize.getScaledSizeWidth(10);
                                  double scrollAmount = (220 + spacing) * 1; // Scroll by 1.5 images

                                  homeController.similarStoreScrollController.animateTo(
                                    homeController.similarStoreScrollController.offset + scrollAmount,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Container(
                                    padding: EdgeInsets.only(
                                      right: MySize.getScaledSizeWidth(22),
                                    ),
                                    color: Colors.transparent,
                                    child: Image.asset(
                                      height: MySize.getScaledSizeHeight(19),
                                      width: MySize.getScaledSizeWidth(19),
                                      ImagePath.arrowRight,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            alignment: Alignment.center,
            height: 84,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.white.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonBottomCard(
                      ImagePath.homeImg,
                      AppString.home,
                    ),
                    commonBottomCard(
                      ImagePath.jobImg,
                      AppString.jobs,
                    ),
                    commonBottomCard(
                      ImagePath.storeIcon,
                      AppString.store,
                    ),
                    commonBottomCard(
                      ImagePath.connectionsImg,
                      AppString.connections,
                    ),
                    commonBottomCard(
                      ImagePath.personIcon,
                      AppString.profile,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column commonBottomCard(imagePath, title) {
    return Column(
      children: [
        Image.asset(
          height: 24,
          width: 24,
          imagePath,
        ),
        SizedBox(
          height: MySize.getScaledSizeHeight(4),
        ),
        Text(
          title,
          style: AppTextStyle.regular500.copyWith(
            fontSize: MySize.getScaledSizeHeight(14),
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Row commonAboutBusinessRow(
    imgPath,
    dynamicText,
  ) {
    return Row(
      children: [
        Image.asset(
          imgPath,
          height: MySize.getScaledSizeHeight(16),
          width: MySize.getScaledSizeWidth(17),
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: MySize.getScaledSizeWidth(5),
        ),
        Text(
          dynamicText,
          style: AppTextStyle.regular400.copyWith(
            fontSize: MySize.getScaledSizeHeight(10),
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  commonUnderRatingButton(text) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: MySize.getScaledSizeHeight(10),
          horizontal: MySize.getScaledSizeWidth(26),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            MySize.getScaledSizeHeight(20),
          ),
          color: AppColors.black1D2935,
        ),
        child: Text(
          text,
          style: AppTextStyle.regular600.copyWith(
            fontSize: MySize.getScaledSizeHeight(12),
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class StarRating extends StatefulWidget {
  final int starCount;
  final double size;
  final Function(int) onRatingChanged;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.size = 24,
    required this.onRatingChanged,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1;
            });
            widget.onRatingChanged(_rating);
          },
          child: index < _rating
              ? Padding(
                  padding: EdgeInsets.only(
                    left: MySize.getScaledSizeHeight(4),
                    right: MySize.getScaledSizeHeight(4),
                  ),
                  child: Image.asset(
                    ImagePath.selectStarImg,
                    width: widget.size,
                    color: AppColors.primary09A8D3,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    left: MySize.getScaledSizeHeight(4),
                    right: MySize.getScaledSizeHeight(4),
                  ),
                  child: Image.asset(
                    ImagePath.starImg,
                    width: widget.size,
                  ),
                ),
        );
      }),
    );
  }
}
