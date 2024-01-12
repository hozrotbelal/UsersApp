import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:usersapp/ui/splash/splash_controller.dart';

import '../../utils/constants.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: colorBgGreyF8,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        primary: false,
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(64.0),
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     fit: BoxFit.cover,
          //     image: AssetImage("images/ic_splash_background.png"),
          //   ),
          // ),
          child: GetBuilder<SplashController>(builder: (controller) {
            return Center(
              child: Image.asset(
                assetImgLogo,
                height: 60.0,
                width: 200.0,
                fit: BoxFit.contain,
              ),
            );
          }),
        ),
      ),
    );
  }
}
