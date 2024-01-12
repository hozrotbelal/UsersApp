import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:usersapp/data/local/service/local_service.dart';
import 'package:usersapp/data/remote/service/remote_service.dart';

class HomeContentController extends GetxController {
  GlobalKey<ScaffoldState> homeKeyScaffolds = GlobalKey<ScaffoldState>();

  late RxBool isLoading;
  late double carouselHeight;
  //ScrollController scrollController = ScrollController();
  ScrollController categoryScrollController = ScrollController();
  ScrollController featuredProductScrollController = ScrollController();
  ScrollController popularAddsScrollController = ScrollController();
  late RemoteService _remoteService;
  late LocalService _localService;
  // SiteSettingsResponse? siteSettings;
  late String currency;
  TextEditingController searchController = TextEditingController();
  TextEditingController typeMessageController = TextEditingController();
  TextEditingController replyController = TextEditingController();
  FocusNode nameFocus = FocusNode();

  bool isOpenCallDialog = false;
  RxInt cartItemCount = 0.obs;
  int userId = 0;
  String email = "";
  bool isLoggedIn = false;
  bool topProductInit = false;
  List<dynamic> topProducts = [];
  var connectionStatus = 1.obs;
  var tabSelected = 0.obs;
  late StreamSubscription<InternetConnectionStatus> _listener;
  List<String> homeTab = ["Popular", "Live", "Bike", "Electronics"];
  List<String> categoryList = ["Property", "Auto Mobiles", "Gagdget", "Electronics", "Electronics"];
  @override
  void onInit() {
    isLoading = false.obs;
    carouselHeight = 140.0;

    searchController = TextEditingController();
    typeMessageController = TextEditingController();
    replyController = TextEditingController();
    _localService = Get.find<LocalService>();
    _remoteService = Get.find<RemoteService>();

    //keyScaffolds = GlobalKey<ScaffoldState>();
    isLoggedIn = _localService.getIsLoggedIn();

    // email = _localService.getUserEmail() ?? "";

    if (isLoggedIn == true) {
      //  fetchData();
    }

    _listener = InternetConnectionChecker().onStatusChange.listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          connectionStatus.value = 1;

          if (isLoggedIn == true) {
            // fetchData();
          }
          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus.value = 0;

          break;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    //scrollController.dispose();
    featuredProductScrollController.dispose();
    categoryScrollController.dispose();
    popularAddsScrollController.dispose();
    // searchController.dispose();
    //nameFocus.dispose();
    _listener.cancel();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> onPageRefresh() async {
    if (isLoggedIn == true) {}
  }

  void updateUI() {
    update();
  }
}
