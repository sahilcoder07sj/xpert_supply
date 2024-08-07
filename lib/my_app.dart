import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbd_flutter/app/modules/splash/bindings/splash_binding.dart';
import 'package:tbd_flutter/app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
    );
  }
}
