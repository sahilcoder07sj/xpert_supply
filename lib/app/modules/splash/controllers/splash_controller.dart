import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tbd_flutter/app/routes/app_pages.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    next();
    super.onInit();
  }

  next(){
    Future.delayed(Duration(seconds: kDebugMode ? 1 : 3)).then((value){
      Get.offAllNamed(Routes.SELECT_USER);
    });
  }

}
