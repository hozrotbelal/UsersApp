import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:usersapp/ui/home/content/home_content_controller.dart';

import '../../../base/widget/central_progress_indicator.dart';
import '../../../base/widget/custom_text_form_field.dart';
import '../../../base/widget/line/line.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/helper/shimmer_helper.dart';

class HomeContentView extends GetView<HomeContentController> {
  const HomeContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeContentController = Get.find<HomeContentController>();

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal.copyWith(
        systemNavigationBarColor: colorWhite,
        statusBarColor: colorBgGreyF8,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        key: controller.homeKeyScaffolds,
        backgroundColor: colorBgGreyF8,
        //  appBar: buildAppBar(statusBarHeight),
        body: SafeArea(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const CentralProgressIndicator();
            } else {
              return RefreshIndicator(
                color: colorAccent,
                backgroundColor: colorBgGreyF8,
                onRefresh: controller.onPageRefresh,
                displacement: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //HeaderWidget(),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        // controller: controller.scrollController,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            allTabView(),
                            buildHomeSearchBox,

                            // TitleView(
                            //   title: "browse_catagories".tr,
                            //   textStyle: Get.theme.textTheme.displaySmall!.copyWith(
                            //     color: colorTextGrey43,
                            //     fontSize: 16.0,
                            //     fontFamily: fontFamilyQuicksand,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   paddingContainer: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                            //   isShowSeeAll: true,
                            //   onSeeAllTap: () {},
                            // ),
                            // SizedBox(height: 130, child: CategoryListView()),
                            // TitleView(
                            //   title: "popular_adds".tr,
                            //   textStyle: Get.theme.textTheme.displaySmall!.copyWith(
                            //     color: colorTextGrey43,
                            //     fontSize: 16.0,
                            //     fontFamily: fontFamilyQuicksand,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   paddingContainer: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                            //   isShowSeeAll: true,
                            //   onSeeAllTap: () {},
                            // ),
                            // PopularAddsListView(),
                            // TitleView(
                            //   title: "special_deals_for_you".tr,
                            //   textStyle: Get.theme.textTheme.displaySmall!.copyWith(
                            //     color: colorTextGrey43,
                            //     fontSize: 16.0,
                            //     fontFamily: fontFamilyQuicksand,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   paddingContainer: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                            //   isShowSeeAll: true,
                            //   onSeeAllTap: () {},
                            // ),
                            // SizedBox(height: 160, child: SpecialDealsListView()),
                            // TitleView(
                            //   title: "top_brands".tr,
                            //   textStyle: Get.theme.textTheme.displaySmall!.copyWith(
                            //     color: colorTextGrey43,
                            //     fontSize: 16.0,
                            //     fontFamily: fontFamilyQuicksand,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   paddingContainer: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                            //   isShowSeeAll: true,
                            //   onSeeAllTap: () {},
                            // ),
                            // SizedBox(height: 130, child: TopBrandListView()),
                            // TitleView(
                            //   title: 'Feature product'.tr,
                            //   textStyle: Get.theme.textTheme.displaySmall!.copyWith(
                            //     color: colorTextGrey43,
                            //     fontSize: 16.0,
                            //     fontFamily: fontFamilyQuicksand,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   paddingContainer: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                            //   isShowSeeAll: true,
                            //   onSeeAllTap: () {},
                            // ),
                            // FeatureProductListView()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  Container get buildHomeSearchBox => Container(
        color: colorLightWhiteFA,
        padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: Get.width * .134,
                child: CustomTextFormField(
                  onTap: () {
                    // controller.goToSearchEnginePage();
                  },
                  isReadOnly: false,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                  colorInputFieldBackground: colorBgGreyF8,
                  colorInputFieldBorder: colorBg2GreyF1,
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 0.0,
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 15, 15),
                    child: SvgPicture.asset(
                      assetSvgIcSearch,
                      height: 15,
                      width: 15,
                      fit: BoxFit.contain,
                      // colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  ),
                  hint: "search_for_anything".tr,
                  // hintsTextStyle: Get.theme.textTheme.displaySmall!.copyWith(
                  //   color: colorBgGreyF8,
                  //   fontSize: 12.0,
                  //   fontFamily: fontFamilyRoboto,
                  //   fontWeight: FontWeight.w500,
                  // ),
                  formController: controller.searchController,
                  inputType: TextInputType.text,
                  contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),
              ),
            ),
          ],
        ).marginOnly(top: 10.0),
      );

  // All Tab View
  Widget allTabView() {
    return Container(
      color: colorLightWhiteFA,
      padding: const EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: Get.width,
            height: 35,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
            child: ListView.builder(
                itemCount: controller.homeTab.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.tabSelected.value = index;
                      // controller.checkItemsGroup(true, controller.itemGroupItems[index].Id);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: controller.tabSelected.value == index ? colorRed2C : colorLightWhite3,
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        border: controller.tabSelected.value == index ? Border.all(color: colorRed2C) : Border.all(color: colorLightGray14),
                      ),
                      child: Row(
                        children: <Widget>[
                          const SizedBox(width: 3),
                          Text(
                            controller.homeTab[index],
                            softWrap: false,
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyMedium!.copyWith(color: controller.tabSelected == index.obs ? colorWhite : colorLightGray5, fontFamily: fontFamilyQuicksand, fontWeight: FontWeight.w500, fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
