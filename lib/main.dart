import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:usersapp/routes/app_pages.dart';

import 'data/local/service/language_service.dart';
import 'data/local/service/local_service.dart';
import 'data/local/service/theme_service.dart';
import 'data/remote/service/remote_service.dart';
import 'essential/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAppEssentials();
  runApp(const MyApp());
}

Future<void> initializeAppEssentials() async {
  Get.log('Starting services ...');

  await GetStorage.init();
  Get.lazyPut(() => RemoteService());
  Get.lazyPut(() => LocalService());
  Get.lazyPut(() => LanguageService());
  Get.put(ThemeService());

  Get.log('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    String lang = Get.find<LanguageService>().getAccessLanguage();
    // String lang = "English";
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale(lang),
      fallbackLocale: Locale(lang),
      themeMode: ThemeMode.system,
      theme: Get.find<ThemeService>().getTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      enableLog: kDebugMode,
    );
  }
}
