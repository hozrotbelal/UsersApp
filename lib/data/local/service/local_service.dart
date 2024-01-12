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

  Future<void> storeAvatarOriginal(String avatarOriginal) {
    return _preferenceUtil.write<String>(
      keyavatarOriginal,
      avatarOriginal,
    );
  }

  String getAvatarOriginal() {
    return _preferenceUtil.read<String>(
      keyavatarOriginal,
      defaultValue: defaultString,
    )!;
  }

  Future<void> storeUserName(String userName) {
    return _preferenceUtil.write<String>(
      keyUserName,
      userName,
    );
  }

  String getUserName() {
    return _preferenceUtil.read<String>(
      keyUserName,
      defaultValue: defaultString,
    )!;
  }

  Future<void> storeUserEmail(String userEmail) {
    return _preferenceUtil.write<String>(
      keyEmail,
      userEmail,
    );
  }

  // String? getUserEmail() {
  //   return _preferenceUtil.read<String>(
  //     keyEmail,
  //     defaultValue: defaultString,
  //   )!;
  // }

  // Future<void> storeUserDOB(String userDob) {
  //   return _preferenceUtil.write<String>(
  //     keyDob,
  //     userDob,
  //   );
  // }

  // String? getUserDOB() {
  //   return _preferenceUtil.read<String>(
  //     keyDob,
  //     defaultValue: defaultString,
  //   )!;
  // }

  // Future<void> storeLoginResponse(LoginResponse loginResponse) {
  //   return _preferenceUtil.write<String>(
  //     keyStoreLoginResponse,
  //     jsonEncode(loginResponse.toJson()),
  //   );
  // }

  // LoginResponse? getLoginResponse() {
  //   final encodedResponse = _preferenceUtil.read<String>(
  //     keyStoreLoginResponse,
  //     defaultValue: defaultString,
  //   )!;

  //   return TextUtil.isNotEmpty(encodedResponse)
  //       ? LoginResponse.fromJson(
  //           jsonDecode(encodedResponse) as Map<String, dynamic>,
  //         )
  //       : null;
  // }

  // Future<void> storeUser(User response) async {
  //   return _preferenceUtil.write<String>(
  //     keyUser,
  //     jsonEncode(response.toJson()),
  //   );
  // }

  // User? getUser() {
  //   final encodedResponse = _preferenceUtil.read<String>(
  //     keyUser,
  //     defaultValue: defaultString,
  //   )!;

  //   return TextUtil.isNotEmpty(encodedResponse)
  //       ? User.fromJson(
  //           jsonDecode(encodedResponse) as Map<String, dynamic>,
  //         )
  //       : null;
  // }

  Future<void> removeLoginResponse() async {
    await _preferenceUtil.delete(keyAccessToken);
  }

  Future<void> removeAccessToken() async {
    await _preferenceUtil.delete(keyAccessToken);
  }

  // Future<void> removeUser() async {
  //   await _preferenceUtil.delete(keyUser);
  // }

  // bool doWeHaveSiteSettings() {
  //   return _preferenceUtil.contains(keySiteSettings);
  // }

  // Future<void> removeSiteSettings() async {
  //   await _preferenceUtil.delete(keySiteSettings);
  // }
}
