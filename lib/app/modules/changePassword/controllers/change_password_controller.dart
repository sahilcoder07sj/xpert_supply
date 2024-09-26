import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewController = TextEditingController();
  RxBool isCurrentHide = true.obs;
  RxBool isNewHide = true.obs;
  RxBool isNewConfirmHide = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

}
