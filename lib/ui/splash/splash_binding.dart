import 'package:get/get.dart';
import 'package:usersapp/ui/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
