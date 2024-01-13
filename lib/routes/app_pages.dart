import 'package:get/get.dart';
import 'package:usersapp/ui/details/user_details_binding.dart';
import 'package:usersapp/ui/details/user_details_view.dart';
import 'package:usersapp/ui/favorite/favorite_binding.dart';
import 'package:usersapp/ui/favorite/favorite_view.dart';
import 'package:usersapp/ui/splash/splash_binding.dart';
import 'package:usersapp/ui/splash/splash_view.dart';

import '../ui/home/container/home_container_binding.dart';
import '../ui/home/container/home_container_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(name: _Paths.home, page: () => const HomeContainerView(), bindings: [
      HomeContainerBinding(),
      FavoriteBinding(),
    ]),
    GetPage(name: _Paths.favorite, page: () => const FavoriteView(), bindings: [
      FavoriteBinding(),
    ]),
    GetPage(name: _Paths.details, page: () => const UserDetailsView(), bindings: [
      UserDetailsBinding(),
    ]),
  ];
}
