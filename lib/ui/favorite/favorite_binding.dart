import 'package:get/get.dart';
import 'package:usersapp/ui/favorite/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FavoriteController>(FavoriteController());
  }
}
