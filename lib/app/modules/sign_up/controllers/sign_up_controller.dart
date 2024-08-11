import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  TextEditingController businessNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordHide = true.obs;
  RxBool isConfirmPasswordHide = true.obs;
  RxBool isAgreePrivacyPolicy = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

}
