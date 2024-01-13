import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:usersapp/data/remote/dto/users/users_response.dart';

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

  Future<UsersResponse> getUsersInfo({
    offset = 0,
    limit = 10,
  }) async {
    var url = "$getUsersInfoUrl?offset=$offset&limit=$limit";

    final response = await ApiUtil.getRequest(
      endPoint: url,
      shouldGetOtherHeaders: false,
    );
    return UsersResponse.fromJson(response.data);
  }
}
