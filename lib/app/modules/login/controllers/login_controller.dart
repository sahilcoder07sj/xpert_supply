import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgotEmailController = TextEditingController();
  String otp = "";
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordHide = true.obs;
  RxBool isNewPasswordHide = true.obs;
  RxBool isConfirmPasswordHide = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

}