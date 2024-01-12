import 'package:get/get.dart';

import '../../data/local/service/local_service.dart';
import '../../data/remote/service/remote_service.dart';

class SplashController extends GetxController {
  late LocalService _localService;
  late RemoteService _remoteService;

  @override
  void onInit() {
    super.onInit();

    _localService = Get.find<LocalService>();
    _remoteService = Get.find<RemoteService>();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
