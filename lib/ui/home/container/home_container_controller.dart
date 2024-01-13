import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:usersapp/ui/home/content/home_content_view.dart';

import '../../../utils/constants.dart';
import '../../favorite/favorite_view.dart';

class HomeContainerController extends GetxController {
  late Widget body;
  late int selectedBottomBarIndex;
  var currentIndex = 0.obs;
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
  late RxBool isFilterDrawerVisible;
  late List<Widget> pages;
  GlobalKey bottomNavigationKey = GlobalKey();
  static int initialPage = 0;
  final PageController controller = PageController(initialPage: initialPage);
  late List<String> iconPath;
  late List<String> iconNames;
  @override
  void onInit() {
    body = const HomeContentView();
    selectedBottomBarIndex = 0;
    iconPath = <String>[assetSvgIcHome, assetSvgIcHeartLikeRed, assetSvgIcChat, assetSvgIcAccount];
    iconNames = <String>["Home", "Favorite", "Chat", "Account"];
    pages = [
      const HomeContentView(),
      const FavoriteView(),
      const HomeContentView(),
      const HomeContentView(),
      // const AccountView(),
    ];
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeBottomBarIndex(int index) {
    selectedBottomBarIndex = index;

    switch (index) {
      case 0:
        body = const HomeContentView();
        break;
      case 1:
        selectedBottomBarIndex = 1;
        body = const FavoriteView();
        break;
      case 2:
        selectedBottomBarIndex = 2;
        break;

      case 3:
        selectedBottomBarIndex = 3;
        //  body = const AccountView();
        break;
      default:
        break;
    }

    update(['bottom_bar', 'body']);
  }
}
