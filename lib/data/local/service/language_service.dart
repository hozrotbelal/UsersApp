import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/preference/preference.dart';

class LanguageService extends GetxService {
  late PreferenceUtil _preferenceUtil;

  LanguageService() {
    _preferenceUtil = PreferenceUtil.on;
  }

  // bool doWeHaveLanguage() {
  //   return _preferenceUtil.contains(keyAccessLocal);
  // }

  // Future<void> storeAccessLanguage(String accessLanguage) {
  //   return _preferenceUtil.write<String>(
  //     keyAccessLocal,
  //     accessLanguage,
  //   );
  // }

  String getAccessLanguage() {
    return _preferenceUtil.read<String>(
      keyAccessLocal,
      defaultValue: "en",
    )!;
  }

  // Future<void> removeAccessLanguage() async {
  //   await _preferenceUtil.delete(keyAccessLocal);
  // }

  Future<void> clearAll() async {
    await _preferenceUtil.clear();
  }
}
