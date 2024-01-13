import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sqflite/sqflite.dart';
import 'package:usersapp/data/local/db/db_provider.dart';
import 'package:usersapp/data/local/db/db_td.dart';
import 'package:usersapp/data/remote/dto/users/users.dart';

import '../../utils/helper/toast.dart';

class FavoriteController extends GetxController {
  GlobalKey<ScaffoldState> favoriteKeyScaffolds = GlobalKey<ScaffoldState>();

  late RxBool isLoading;
  ScrollController xScrollController = ScrollController();
  ScrollController scrollController = ScrollController();

  List<Users> _favoriteUsersList = [];
  List<Users> get allFavoriteUsersList => _favoriteUsersList;
  bool isInitial = true;

  @override
  void onInit() {
    isLoading = false.obs;
    getAllFavoriteFromDB();
    super.onInit();
  }

  Future<void> getAllFavoriteFromDB() async {
    getAllFavoriteUsers().then((result) async {
      isInitial = false;
      _favoriteUsersList = result;
      updateUI();
    });
  }

  Future<void> removeFavoriteFromUserList(int id) async {
    var removeFavouriteUser = await removeFromFavorite(id);
    if (removeFavouriteUser) {
      reset();
      ToastUtil.show("Remove succesfully");
    }
  }

  void reset() {
    isInitial = true;
    _favoriteUsersList = [];
    updateUI();
    getAllFavoriteFromDB();
  }

/*..... Local Database Used ......*/

  Future<bool> removeFromFavorite(int id) async {
    final Database database = await DBProvider.db.database;
    int result = await database.delete(FavouritesTable.tableName, where: '${FavouritesTable.columnId} = ?', whereArgs: [id]);
    return result != 0;
  }

  // Get All Users Favorite List
  Future<List<Users>> getAllFavoriteUsers() async {
    List<Users> favoriteUsersList = [];
    final Database database = await DBProvider.db.database;
    final result = await database.query(FavouritesTable.tableName);
    for (var r in result) {
      favoriteUsersList.add(Users.fromJson(r));
    }
    // Get.log("favoriteList:>> ${favoriteUsersList.length}");

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
