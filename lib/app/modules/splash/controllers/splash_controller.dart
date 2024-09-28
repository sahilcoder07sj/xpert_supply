import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    next();
    super.onInit();
  }

  next() {
    Future.delayed(Duration(seconds: kDebugMode ? 1 : 3)).then((value) {
        if (GetStorageData().readObject(GetStorageData().userData) != null) {
        if (GetStorageData()
                .readObject(GetStorageData().userData)["vendor_no"] !=
            null) {
          Get.offAllNamed(Routes.MANAGEMENT);
          Constants.selectUser = Constants.vendor;
        } else {
          Constants.selectUser = Constants.consumer;
          Get.offAllNamed(Routes.CONSUMER_PRODUCTS);
        }
      }
    });
  }
}
