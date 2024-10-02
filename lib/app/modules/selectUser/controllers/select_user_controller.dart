import 'package:get/get.dart';
import 'package:tbd_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:tbd_flutter/app/modules/sign_up/controllers/sign_up_controller.dart';

class SelectUserController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Get.delete<LoginController>(force: true);
    Get.delete<SignUpController>(force: true);
    super.onReady();
  }

}
