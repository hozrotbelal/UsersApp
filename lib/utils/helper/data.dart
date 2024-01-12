import 'package:flutter/cupertino.dart';

import '../constants.dart';

class DataUtil {
  static bool shouldShowReviewerCount(int? reviewerCount) {
    return reviewerCount != null && reviewerCount > 0;
  }

  static Color getStatusColor(String status) {
    Color statusColor = colorLightGray2;

    switch (status.trim()) {
      case pending:
        statusColor = colorLightOrange1;
        break;

      case confirmed:
        statusColor = colorStepComplete;
        break;

      case delivered:
        statusColor = colorLightGreen1;
        break;

      case processing:
        statusColor = colorPurple;
        break;

      case hold:
        statusColor = colorItemActiveBackground;
        break;

      case returned:
        statusColor = colorLightGray3;
        break;
      case canceled:
        statusColor = colorLightGray2;
        break;
      default:
        break;
    }

    return statusColor;
  }

  static bool validateEmail(String value) {
    String? pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
}
