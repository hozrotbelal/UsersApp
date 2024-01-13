import 'package:flutter/cupertino.dart';

class DataUtil {
  static bool shouldShowReviewerCount(int? reviewerCount) {
    return reviewerCount != null && reviewerCount > 0;
  }

  static bool validateEmail(String value) {
    String? pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
}
