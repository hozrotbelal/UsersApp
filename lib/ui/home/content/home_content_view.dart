import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:usersapp/ui/home/content/component/user_item.dart';

import 'package:usersapp/ui/home/content/home_content_controller.dart';

import '../../../base/widget/appbar/custom_app_bar.dart';
import '../../../base/widget/custom_text_form_field.dart';
import '../../../utils/constants.dart';
import '../../../utils/enum/enum.dart';
import '../../../utils/helper/shimmer_helper.dart';

class HomeContentView extends GetView<HomeContentController> {
  const HomeContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: GetBuilder<HomeContentController>(
          builder: (controller) {
            return parentBody;
          },
        ),
      ),
    );
  }

  // Main Body
  Stack get parentBody => Stack(
        children: <Widget>[
          // background,
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomAppBar(
                  title: "User List",
                  isBackButtonExist: false,
                  paddindAppBar: EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
                  horizontalChild: Expanded(
                    child: SizedBox(),
                  ),
                ),
                // buildHomeSearchBox,
                Expanded(
                  child: buildAllUserItemList(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: buildLoadingIndicator(),
                ),
              ],
            ),
          ),
        ],
      );

// Get User List

  buildAllUserItemList() {
    if (controller.isInitial && controller.allUsersList.isEmpty) {
      return SingleChildScrollView(child: ShimmerHelper().buildListShimmer());
    } else if (controller.allUsersList.isNotEmpty) {
      return RefreshIndicator(
        color: colorPrimary,
        backgroundColor: Colors.white,
        displacement: 0,
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 2), () {
            controller.isLoadComplete = false;
            //  controller.isLoading = false.obs;
            controller.getAllDataList(RefreshType.DEFAULT);
          });
        },
        child: SingleChildScrollView(
          controller: controller.xScrollController,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.allUsersList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              // 3
              return UserItem(
                  item: controller.allUsersList[index],
                  onTap: () {},
                  onPressedAddedToFavorite: () {
                    controller.addOrUpdateUserFavorite(controller.allUsersList[index]);
                  });
            },
          ),
        ),
      );
    } else if (controller.totalRecordCount == 0) {
      return Center(
        child: Text(
          "no_data_available_mgs".tr,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: colorLightGray1,
            fontFamily: fontFamilyQuicksand,
          ),
        ),
      );
    } else {
      return Container(); // should never be happening
    }
  }

  Container buildLoadingContainer() {
    return Container(
      height: controller.showLoadingContainer ? 36 : 0,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text(controller.totalRecordCount.value == controller.allUsersList.length ? "No More Products" : "Loading More Products ..."),
      ),
    );
  }

  Widget buildLoadingIndicator() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      alignment: Alignment.center,
      height: controller.showLoadingContainer ? 36 : 0,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            controller.totalRecordCount.toString() == controller.allUsersList.length.toString() ? "no_more_data_mgs".tr : "loading_mgs".tr,
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              fontFamily: fontFamilyQuicksand,
              fontStyle: FontStyle.italic,
              color: colorLightGray2,
            ),
          ),
          if (controller.totalRecordCount.toString() != controller.allUsersList.length.toString())
            SpinKitThreeBounce(
              size: 20.0,
              color: Get.theme.primaryColor,
            ),
        ],
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
}
