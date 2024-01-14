import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sqflite/sqflite.dart';
import 'package:usersapp/data/local/db/db_provider.dart';
import 'package:usersapp/data/local/db/db_td.dart';
import 'package:usersapp/data/remote/dto/users/users.dart';

import '../../utils/constants.dart';
import '../../utils/helper/toast.dart';

class UserDetailsController extends GetxController {
  GlobalKey<ScaffoldState> favoriteKeyScaffolds = GlobalKey<ScaffoldState>();

  late RxBool isLoading;
  ScrollController xScrollController = ScrollController();
  ScrollController scrollController = ScrollController();

  Users? _usersObj;
  Users? get usersObj => _usersObj;
  bool isInitial = true;
  RxBool isFavorite = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments[keyUser] != null) {
      _usersObj = Get.arguments[keyUser];
      if (_usersObj != null) {
        addOrUpdateUserFavorite(_usersObj!);
      }
    }
    super.onInit();
  }

  void reset() {
    isInitial = true;
    isFavorite = false.obs;
    updateUI();
  }

/*..... Local Database Used ......*/
  Future<List<Users>> isAlreadyAddedFavorite(List<Users> userList, int id) async {
    return userList.isNotEmpty ? userList.where((o) => o.id == id).toList() : [];
  }

  addOrUpdateUserFavorite(Users users) async {
    await getAllFavoriteUsers().then((result) async {
      var alreadyAddedFavoriteList = await isAlreadyAddedFavorite(result, users.id!);
      if (alreadyAddedFavoriteList.isNotEmpty) {
        isFavorite = true.obs;
        updateUI();
      } else {
        var addToFavoriteValue = await addToFavorite(users);
        if (addToFavoriteValue) {
          isFavorite = true.obs;
          ToastUtil.show("Add favorite successfully");
          updateUI();
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
