import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sqflite/sqflite.dart';
import 'package:usersapp/data/local/db/db_provider.dart';
import 'package:usersapp/data/local/db/db_td.dart';
import 'package:usersapp/data/local/service/local_service.dart';
import 'package:usersapp/data/remote/dto/users/users.dart';
import 'package:usersapp/data/remote/service/remote_service.dart';

import '../../../base/exception/app_exception.dart';
import '../../../utils/enum/enum.dart';
import '../../../utils/helper/toast.dart';

class HomeContentController extends GetxController {
  GlobalKey<ScaffoldState> homeKeyScaffolds = GlobalKey<ScaffoldState>();

  late RxBool isLoading;
  ScrollController xScrollController = ScrollController();
  ScrollController scrollController = ScrollController();

  late RemoteService _remoteService;
  late LocalService _localService;

  TextEditingController searchController = TextEditingController();

  FocusNode nameFocus = FocusNode();

  int offSet = 10;
  int limit = 10;
  int page = 1;

  var totalRecordCount = RxInt(0);

  bool isLoadComplete = false;
  bool isLoadMoreRunning = false;
  bool showLoadingContainer = false;
  bool isInitial = true;

  List<Users> _usersList = [];
  List<Users> get allUsersList => _usersList;

  List<Users> _favoriteUsersList = [];

  @override
  void onInit() {
    isLoading = false.obs;
    searchController = TextEditingController();
    _localService = Get.find<LocalService>();
    _remoteService = Get.find<RemoteService>();

    getAllDataList(RefreshType.DEFAULT);
    xScrollController = ScrollController()..addListener(loadMore);

    super.onInit();
  }

// load More
  void loadMore() async {
    if (isLoadMoreRunning == false && xScrollController.position.pixels == xScrollController.position.maxScrollExtent && totalRecordCount.value > page * limit) {
      page++;
      isLoadMoreRunning = true;
      getAllDataList(RefreshType.LOAD_MORE);
    }
  }

  // RefreshType
  void getAllDataList(RefreshType type) async {
    if (type == RefreshType.DEFAULT || type == RefreshType.REFRESH) {
      page = 1;
      _usersList.clear();
      isLoadComplete = false;
      isInitial = true;
      showLoadingContainer = false;
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

      var usersDataResponse = await _remoteService.getUsersInfo(offset: page > 1 ? page * offSet : page);
      if (usersDataResponse != null) {
        if (usersDataResponse.users!.isNotEmpty) {
          isLoadComplete = false;
          _usersList.addAll(usersDataResponse.users ?? []);
        }
        totalRecordCount.value = usersDataResponse.totalUsers ?? 0;
        showLoadingContainer = false;
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
      }
    }
  }

/*..... Local Database Used ......*/

  Future<List<Users>> isAlreadyAddedFavorite(List<Users> userList, int id) async {
    return userList.isNotEmpty ? userList.where((o) => o.id == id).toList() : [];
  }

  addOrUpdateUserFavorite(Users users) async {
    await getAllFavoriteUsers().then((result) async {
      _favoriteUsersList = result;
      var alreadyAddedFavoriteList = await isAlreadyAddedFavorite(_favoriteUsersList, users.id!);
      if (alreadyAddedFavoriteList.isNotEmpty) {
        // Get.log("users:>> ${alreadyAddedCartList.length}");
        ToastUtil.show("User already added");
      } else {
        var addToFavoriteValue = await addToFavorite(users);
        if (addToFavoriteValue) {
          ToastUtil.show("Add favorite successfully");
        }
      }
    });
  }

  Future<bool> addToFavorite(Users users) async {
    final Database database = await DBProvider.db.database;
    int id = await database.insert(FavouritesTable.tableName, users.toMap());
    return id != 0;
  }

  Future<bool> removeFromFavorite(int id) async {
    final Database database = await DBProvider.db.database;
    int result = await database.delete(FavouritesTable.tableName, where: '${FavouritesTable.columnId} = ?', whereArgs: [id]);
    return result != 0;
  }

  Future<List<Users>> getAllFavoriteUsers() async {
    List<Users> favoriteUsersList = [];
    final Database database = await DBProvider.db.database;
    final result = await database.query(FavouritesTable.tableName);
    for (var r in result) {
      favoriteUsersList.add(Users.fromJson(r));
    }
    return favoriteUsersList;
  }

  @override
  void onClose() {
    xScrollController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void updateUI() {
    update();
  }
}
