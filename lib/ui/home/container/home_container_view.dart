import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:usersapp/base/others_lib/animated_bottom_nav/animated_bottom_navigation_bar.dart';

import 'package:usersapp/ui/home/container/home_container_controller.dart';
import 'package:usersapp/utils/helper/toast.dart';

import '../../../utils/constants.dart';

class HomeContainerView extends GetView<HomeContainerController> {
  const HomeContainerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime preBackpress = DateTime.now();
    final autoSizeGroup = AutoSizeGroup();

    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal.copyWith(
        // systemNavigationBarColor: colorSplashNavigationBarBackground,
        // systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: colorBgGreyF8,
        statusBarBrightness: Brightness.light,
      ),
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          var isValueExit = false;
          if (controller.selectedBottomBarIndex > 0) {
            controller.changeBottomBarIndex(0);
            return;
          } else {
            if (controller.selectedBottomBarIndex == 0) {
              isValueExit = true;
              final timegap = DateTime.now().difference(preBackpress);
              final cantExit = timegap >= const Duration(seconds: 2);
              preBackpress = DateTime.now();
              if (cantExit) {
                //show snackbar
                ToastUtil.show("Press Back button again to Exit");
                return;
              } else {
                return;
              }
            }
          }

          return;
        },
        //controller.selectedBottomBarIndex == 0 ? isExitDesired : false,

        child: Scaffold(
          key: controller.keyScaffold,
          backgroundColor: colorBgGreyF8,
          extendBodyBehindAppBar: true,
          body: PageView(
            controller: controller.controller,
            onPageChanged: (index) => _onJumpTo(index),
            physics: const NeverScrollableScrollPhysics(),
            children: controller.pages,
          ),
          //getBody(),
          floatingActionButton: Container(
            margin: const EdgeInsets.only(top: 0, left: 4, right: 4, bottom: 5),
            height: 40,
            width: 40,
            child: FloatingActionButton(
              backgroundColor: colorPrimary,
              child: SvgPicture.asset(
                assetSvgBottomCenterDocked,
              ),
              onPressed: () {
                print("Button is pressed.");
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Obx(
            () => AnimatedBottomNavigationBar.builder(
              itemCount: controller.iconPath.length,
              tabBuilder: (int index, bool isActive) {
                final color = isActive ? colorPrimary : colorUnselectedBottomBar;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      controller.iconPath[index],
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: AutoSizeText(
                        controller.iconNames[index],
                        maxLines: 1,
                        style: TextStyle(color: color),
                        group: autoSizeGroup,
                      ),
                    )
                  ],
                );
              },
              backgroundColor: colorWhite,
              activeIndex: controller.currentIndex.value,
              //  splashColor: colors.activeNavigationBarColor,
              //notchAndCornersAnimation: borderRadiusAnimation,
              // splashSpeedInMilliseconds: 300,
              notchSmoothness: NotchSmoothness.softEdge,
              gapLocation: GapLocation.center,
              // leftCornerRadius: 32,
              // rightCornerRadius: 32,
              onTap: (index) => _onJumpTo(index),
              //  hideAnimationController: _hideBottomBarAnimationController,
              // shadow: BoxShadow(
              //   offset: Offset(0, 1),
              //   blurRadius: 12,
              //   spreadRadius: 0.5,
              //   color: colors.activeNavigationBarColor,
              // ),
              key: controller.bottomNavigationKey,
            ),

            //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: FloatingActionButton(
            //   child: Icon(
            //     Icons.add,
            //     size: 40.0,
            //   ),
            //   onPressed: () {},
            // ),

            //  drawerEnableOpenDragGesture: false,

            // body: GetBuilder<HomeContainerController>(
            //   id: 'body',
            //   builder: (controller) {
            //     return controller.body;
            //   },
            // ),
          ),
        ),
      ),
    );
  }

  _onJumpTo(int index) {
    controller.controller.jumpToPage(index);
    controller.currentIndex.value = index;
  }

  onExitPressed() async {
    final isConfirmed = await isExitDesired();

    if (isConfirmed!) {
      _exitSetup();
    }
  }

  Widget getBody() {
    return IndexedStack(
      index: controller.currentIndex.value,
      children: controller.pages,
    );
  }

  Future<bool>? isExitDesired() async {
    return await showDialog<bool>(
            context: Get.context!,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Are you sure?',
                  textAlign: TextAlign.center,
                ),
                titleTextStyle: Get.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontFamily: fontFamilyQuicksand,
                  color: colorLightGray2,
                ),
                content: const Text(
                  'If you want to exit this application.',
                  textAlign: TextAlign.center,
                ),
                contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                actions: [
                  TextButton(
                    onPressed: () {
                      //   Get.back(canPop: true);
                      Navigator.of(context).pop(true);
                    },
                    child: setTitle("Exit Ezcart", Get.width * 0.04, colorLightGray2),
                  ),
                  TextButton(
                    onPressed: () {
                      // Get.back(canPop: false);
                      Navigator.of(context).pop(false);
                    },
                    child: setTitle("No", Get.width * 0.04, colorLightGray1),
                  ),
                ],
              );
            }) ??
        false;
  }

  void _exitSetup() {
    Get.back();
  }

  Text setTitle(String title, double fontsize, Color textColor) {
    return Text(
      title,
      style: Get.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: fontsize,
        fontFamily: fontFamilyQuicksand,
        color: textColor,
      ),
    );
  }

  Widget buildBottomBar() {
    return GetBuilder<HomeContainerController>(
      id: 'bottom_bar',
      builder: (HomeContainerController viewController) {
        return BottomAppBar(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: colorPrimary,
              currentIndex: viewController.selectedBottomBarIndex,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              // selectedFontSize: 10.0,
              // unselectedFontSize: 11.0,
              unselectedItemColor: colorLightWhite3.withOpacity(.8),
              selectedLabelStyle: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: Get.width * 0.033,
                fontFamily: fontFamilyQuicksand,
                color: const Color(0xFFfafffb),
              ),
              unselectedLabelStyle: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: Get.width * 0.033,
                fontFamily: fontFamilyQuicksand,
                color: const Color(0xFFf8d2c0),
              ),
              items: [
                getBottomBarItem(
                  viewController,
                  Icons.home_outlined,
                  'home'.tr,
                  0,
                ),
                getBottomBarItem(
                  viewController,
                  Icons.message,
                  'bottom_item_message'.tr,
                  1,
                ),
                getBottomBarItem(
                  viewController,
                  Icons.shopping_cart_outlined,
                  'bottom_item_home'.tr,
                  2,
                  hasBatch: true,
                ),
                getBottomBarItem(
                  viewController,
                  Icons.person_outline_outlined,
                  'bottom_item_profile'.tr,
                  3,
                ),
              ],
              onTap: (index) {
                viewController.changeBottomBarIndex(index);
              },
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem getBottomBarItem(
    HomeContainerController viewController,
    IconData icon,
    String title,
    int position, {
    bool hasBatch = false,
  }) {
    final theme = Get.theme.bottomNavigationBarTheme;
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.topRight,
        children: [
          Icon(
            icon,
            size: 27.0,
            color: position == viewController.selectedBottomBarIndex ? theme.selectedItemColor : colorLightWhite3.withOpacity(.8),
          ),
          if (hasBatch && viewController.notificationCount > 0)
            Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorRed28,
                border: Border.fromBorderSide(
                  BorderSide(
                    width: 2.0,
                    color: theme.backgroundColor!,
                  ),
                ),
              ),
              child: Center(
                child: Obx(
                  () => Text(
                    "${viewController.notificationCount.value}",
                    style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
        ],
      ).marginOnly(bottom: 1.5),
      label: title,
    );
  }
}
