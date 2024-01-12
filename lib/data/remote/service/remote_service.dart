import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../utils/constants.dart';
import '../../../utils/network/api.dart';

class RemoteService extends GetxService {
  RemoteService() {
    if (ApiUtil.client == null) {
      ApiUtil.client = dio.Dio(
        dio.BaseOptions(
          baseUrl: baseApiUrl,
          headers: {
            HttpHeaders.acceptHeader: responseOfJsonType,
          },
        ),
      );

      ApiUtil.client!.interceptors.add(
        PrettyDioLogger(
          requestHeader: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
        ),
      );
    }
  }
//
}
