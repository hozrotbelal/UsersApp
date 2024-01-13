import 'package:get/get.dart';
import 'package:usersapp/ui/details/user_details_controller.dart';

class UserDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserDetailsController>(UserDetailsController());
  }
}
