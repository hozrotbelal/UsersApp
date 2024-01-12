import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetX;
import '../../base/exception/app_exception.dart';
import '../../data/local/service/local_service.dart';
import '../helper/text.dart';

class ApiUtil {
  static Dio? client;

  static Future<Map<String, String>> _getOtherCommonHeaders() async {
    HashMap<String, String> headers = HashMap();

    final localService = GetX.Get.find<LocalService>();

    if (localService.doWeHaveAccessToken() &&
        TextUtil.isNotEmpty(
          localService.getAccessToken(),
        )) {
      headers["Authorization"] = localService.getAccessToken();
    }

    return headers;
  }

  static void _handleException(dynamic e) {
    if ((e != null) && (e is DioException) && (e.message!.trim().isNotEmpty)) {
      if (e.type == DioExceptionType.badResponse && e.response != null && e.response!.statusCode == HttpStatus.unauthorized) {
        throw AppException(e.response!.statusMessage);
        // TODO: Send to client unauthorized route
      } else if (e.error is SocketException) {
        throw AppException('no_internet_connection'.tr);
      } else {
        throw AppException(e.message);
      }
    } else {
      throw e;
    }
  }

  static Future<Response> getRequest({
    required String endPoint,
    bool shouldGetOtherHeaders = false,
  }) async {
    var response;
    var options = Options();

    if (shouldGetOtherHeaders) {
      options = options.copyWith(
        headers: await _getOtherCommonHeaders(),
      );
    }

    try {
      response = await client!.get(
        endPoint,
        options: options,
      );
    } on DioError catch (e) {
      _handleException(e);
    } catch (e) {
      _handleException(e);
    }

    return response;
  }

  static Future<Response> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool shouldGetOtherHeaders = false,
  }) async {
    var response;
    var options = Options();

    if (shouldGetOtherHeaders) {
      options = options.copyWith(
        headers: await _getOtherCommonHeaders(),
      );
    }

    try {
      response = await client!.post(
        endPoint,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      _handleException(e);
    } catch (e) {
      _handleException(e);
    }

    return response;
  }

  static Future<Response> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool shouldGetOtherHeaders = false,
  }) async {
    var response;
    var options = Options();

    if (shouldGetOtherHeaders) {
      options = options.copyWith(
        headers: await _getOtherCommonHeaders(),
      );
    }

    try {
      response = await client!.delete(
        endPoint,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      _handleException(e);
    } catch (e) {
      _handleException(e);
    }

    return response;
  }

  static Future<Response> postFormUrlEncodedRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool shouldGetOtherHeaders = false,
  }) async {
    var response;
    var options = Options(contentType: Headers.formUrlEncodedContentType);

    if (shouldGetOtherHeaders) {
      options = options.copyWith(
        headers: await _getOtherCommonHeaders(),
      );
    }

    try {
      response = await client!.post(
        endPoint,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      _handleException(e);
    } catch (e) {
      _handleException(e);
    }

    return response;
  }

  static Future<Response> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool shouldGetOtherHeaders = false,
  }) async {
    var response;
    var options = Options();

    if (shouldGetOtherHeaders) {
      options = options.copyWith(
        headers: await _getOtherCommonHeaders(),
      );
    }

    try {
      response = await client!.put(
        endPoint,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      _handleException(e);
    } catch (e) {
      _handleException(e);
    }

    return response;
  }

  static Future<Response> multiPartPostRequest({
    required String endPoint,
    required Map<String, dynamic> data,
    bool shouldGetOtherHeaders = false,
  }) async {
    var response;
    var options = Options();

    if (shouldGetOtherHeaders) {
      options = options.copyWith(
        headers: await _getOtherCommonHeaders(),
      );
    }

    try {
      response = await client!.post(
        endPoint,
        data: FormData.fromMap(data),
        options: options,
      );
    } on DioException catch (e) {
      _handleException(e);
    } catch (e) {
      _handleException(e);
    }

    return response;
  }

  static String appendPathIntoPostfix(String postFix, String? value) {
    if (value != null && value.trim().isNotEmpty && postFix.trim().isNotEmpty) {
      postFix += ("/" + value);
    }

    return postFix;
  }

  static String appendParamIntoPostfix(
    String postFix,
    String key,
    String? value,
  ) {
    if (value != null) {
      if (postFix.isEmpty) {
        postFix += "?";
      } else {
        postFix += "&";
      }

      postFix += (key + "=" + value);
    }

    return postFix;
  }

  static Map<String, dynamic> appendParamIntoData(
    Map<String, dynamic> data,
    String key,
    dynamic value,
  ) {
    if (value != null) {
      data[key] = value;
    }

    return data;
  }
}
