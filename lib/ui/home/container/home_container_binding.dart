import 'package:get/get.dart';
import 'package:usersapp/ui/home/container/home_container_controller.dart';
import 'package:usersapp/ui/home/content/home_content_controller.dart';

class HomeContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeContainerController>(HomeContainerController());
    Get.put<HomeContentController>(HomeContentController());
  }
}
