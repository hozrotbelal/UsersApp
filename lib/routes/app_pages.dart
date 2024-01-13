import 'package:get/get.dart';
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
      //AccountBinding(),
    ]),
  ];
}
