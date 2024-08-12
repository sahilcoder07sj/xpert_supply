import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbd_flutter/app/CommonWidget/common_widget.dart';
import 'package:tbd_flutter/app/CommonWidget/screen.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Utils.darkStatusBar();
    Get.put(SplashController());
    return CommonScreen(
      backgroundColor: AppColors.primary,
      isAppbar: false,
      body: Center(
        child: CircleAvatar(
          radius: 90.0,
          backgroundColor: AppColors.white.withOpacity(0.2),
          child: CircleAvatar(
            radius: 80.0,
            backgroundColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}
