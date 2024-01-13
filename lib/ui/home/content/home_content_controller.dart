import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:usersapp/data/local/service/local_service.dart';
import 'package:usersapp/data/remote/dto/users/users.dart';
import 'package:usersapp/data/remote/service/remote_service.dart';

import '../../../base/exception/app_exception.dart';
import '../../../utils/enum/enum.dart';
import '../../../utils/helper/toast.dart';

class HomeContentController extends GetxController {
  GlobalKey<ScaffoldState> homeKeyScaffolds = GlobalKey<ScaffoldState>();

  late RxBool isLoading;
  late double carouselHeight;
  ScrollController xScrollController = ScrollController();
  ScrollController scrollController = ScrollController();

  late RemoteService _remoteService;
  late LocalService _localService;
  // SiteSettingsResponse? siteSettings;

  TextEditingController searchController = TextEditingController();

  FocusNode nameFocus = FocusNode();

  bool isOpenCallDialog = false;

  int userId = 0;

  int offSet = 20;
  int limit = 10;

  int page = 1;

  var totalRecordCount = RxInt(0);

  bool isLoadComplete = false;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;
  bool showLoadingContainer = false;

  bool isConnectivity = true;
  bool isInitial = true;
  List<Users> _usersList = [];
  List<Users> get allUsersList => _usersList;
  var connectionStatus = 1.obs;
  var tabSelected = 0.obs;
  late StreamSubscription<InternetConnectionStatus> _listener;

  @override
  void onInit() {
    isLoading = false.obs;
    searchController = TextEditingController();
    _localService = Get.find<LocalService>();
    _remoteService = Get.find<RemoteService>();

    // _listener = InternetConnectionChecker().onStatusChange.listen((InternetConnectionStatus status) {
    //   switch (status) {
    //     case InternetConnectionStatus.connected:
    //       connectionStatus.value = 1;

    //       getAllDataList(RefreshType.DEFAULT);
    //       break;
    //     case InternetConnectionStatus.disconnected:
    //       connectionStatus.value = 0;

    //       break;
    //   }
    // });
    getAllDataList(RefreshType.DEFAULT);
    xScrollController = ScrollController()..addListener(loadMore);

    super.onInit();
  }

// load More
  void loadMore() async {
    if (isFirstLoadRunning == false && isLoadMoreRunning == false && xScrollController.position.pixels == xScrollController.position.maxScrollExtent && totalRecordCount.value > page * limit) {
      page++;
      isLoadMoreRunning = true;
      getAllDataList(RefreshType.LOAD_MORE);
    }
  }

  void getAllDataList(RefreshType type) async {
    if (type == RefreshType.DEFAULT || type == RefreshType.REFRESH) {
      page = 1;
      _usersList.clear();
      isLoadComplete = false;
      isInitial = true;
      isFirstLoadRunning = false;
      showLoadingContainer = true;
      totalRecordCount.value = 0;
      updateUI();
    }
    if (!isLoadComplete) {
      showLoadingContainer = true;
      getAllUsersItemList();
    }
  }

  // Get All Users List
  void getAllUsersItemList() async {
    try {
      isLoadComplete = true;
      isLoading = true.obs;

      var usersDataResponse = await _remoteService.getUsersInfo(offset: page > 1 ? page * 10 : page);
      if (usersDataResponse != null) {
        if (usersDataResponse.users!.isNotEmpty) {
          isLoadComplete = false;
          _usersList.addAll(usersDataResponse.users ?? []);
        }
        totalRecordCount.value = usersDataResponse.totalUsers ?? 0;
        isFirstLoadRunning = false;
      } else {
        _usersList = [];
        totalRecordCount.value = 0;
      }
      isLoadMoreRunning = false;
      isLoading = false.obs;
      isInitial = false;
      showLoadingContainer = false;
      updateUI();
    } catch (e) {
      await Future.delayed(const Duration(seconds: 3));
      isLoading = false.obs;
      isInitial = false;
      _usersList = [];
      updateUI();
      Get.log("Error: ${e.toString()}");
      if (e is AppException) {
        Get.log("AppException: ${e.toString()}");
        ToastUtil.show(e.toString());
      } else {
        ToastUtil.show(e.toString());
        //  ToastUtil.show('Public search error item'.tr);
      }
    }
  }

  @override
  void onClose() {
    xScrollController.dispose();
    scrollController.dispose();
    _listener.cancel();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> onPageRefresh() async {
    _usersList.clear();
    isLoadComplete = false;
    isFirstLoadRunning = true;
    totalRecordCount.value = 0;
    updateUI();
    getAllDataList(RefreshType.REFRESH);
  }

  void updateUI() {
    update();
  }
}
