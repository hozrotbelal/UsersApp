import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ToastUtil {
  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void showSnackbar(
    String title,
    String message,
  ) {
    Get.snackbar(
      title,
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.fromLTRB(15, 22, 15, 2),
      borderRadius: 0,
      mainButton: TextButton(
        onPressed: () {},
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodyMedium!.copyWith(
            fontSize: 13,
            color: colorLightGray4,
            fontFamily: fontFamilyQuicksand,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
