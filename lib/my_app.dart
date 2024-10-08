import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/splash/bindings/splash_binding.dart';
import 'package:tbd_flutter/app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Utils.screenPortrait();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      builder: (context, child) {
        child = MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
        );
        child = EasyLoading.init()(context, child);
        return child;
      },
    );
  }
}
