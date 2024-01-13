import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:usersapp/base/others_lib/animated_bottom_nav/animated_bottom_navigation_bar.dart';
import 'package:usersapp/ui/favorite/favorite_controller.dart';

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
        canPop: true,
        onPopInvoked: (didPop) {
          var isValueExit = false;
          if (controller.selectedBottomBarIndex > 0) {
            // controller.changeBottomBarIndex(0);
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
              notchSmoothness: NotchSmoothness.softEdge,
              gapLocation: GapLocation.center,
              onTap: (index) => _onJumpTo(index),
              key: controller.bottomNavigationKey,
            ),
          ),
        ),
      ),
    );
  }

  _onJumpTo(int index) {
    controller.controller.jumpToPage(index);
    controller.currentIndex.value = index;
    if (index == 1) {
      final favoriteController = Get.find<FavoriteController>();
      favoriteController.getAllFavoriteFromDB();
    }
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
                    child: setTitle("Exit ", Get.width * 0.04, colorLightGray2),
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
}
