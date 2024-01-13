import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/preference/preference.dart';

class LocalService extends GetxService {
  late PreferenceUtil _preferenceUtil;

  LocalService() {
    _preferenceUtil = PreferenceUtil.on;
  }

  bool doWeHaveAccessToken() {
    return _preferenceUtil.contains(keyAccessToken);
  }

  Future<void> storeAccessToken(String accessToken) {
    return _preferenceUtil.write<String>(
      keyAccessToken,
      accessToken,
    );
  }

  String getAccessToken() {
    return _preferenceUtil.read<String>(
      keyAccessToken,
      defaultValue: defaultString,
    )!;
  }

  Future<void> storeIsLoggedIn(bool isLoggedIn) {
    return _preferenceUtil.write<bool>(
      keyStoreIsLoggedIn,
      isLoggedIn,
    );
  }

  bool getIsLoggedIn() {
    return _preferenceUtil.read<bool>(
      keyStoreIsLoggedIn,
      defaultValue: false,
    )!;
  }
}
