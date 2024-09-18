import 'dart:io';

import 'package:tbd_flutter/app/CommonWidget/dialogue.dart';
import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:tbd_flutter/app/modules/sign_up/model/sign_up_model.dart';
import '../../../data/all.dart';

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

  bool validation(){
    if(businessNameController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterBusinessName);
      return false;
    } else if(nameController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterName);
      return false;
    } else if(emailController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterEmail);
      return false;
    } else if(!GetUtils.isEmail(emailController.text)){
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterValidEmail);
      return false;
    } else if(passwordController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterPassword);
      return false;
    } else if(!RegExp(Constants.passwordRegX).hasMatch(passwordController.text)){
      CommonDialogue.alertActionDialogApp(message: AppStrings.passwordValidation);
      return false;
    } else if(confirmPasswordController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterConfirmPassword);
      return false;
    } else if(passwordController.text != confirmPasswordController.text){
      CommonDialogue.alertActionDialogApp(message: AppStrings.passwordNotMatch);
      return false;
    } else if(!isAgreePrivacyPolicy.value){
      CommonDialogue.alertActionDialogApp(message: AppStrings.IAgreeTermsPrivacy);
      return false;
    }
    return true;
  }

  sendOtpApi() async {
    FormData formData = FormData.fromMap({
      'business_name': businessNameController.text.trim(),
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
      'password_confirmation': confirmPasswordController.text.trim(),
      'device_id': "vdvd",
      'device_token': "vcsc",
      'device_type': Platform.isAndroid ? "ANDROID" : "IOS",
    });
    final data = await APIFunction().apiCall(
      apiName: Constants.vendorSignUp,
      context: Get.context!,
      params: formData,
    );

    SignUpModel model = SignUpModel.fromJson(data);
    if (model.status == 1) {
      Constants.token = model.token ?? "";
      Constants.isSignUp = true;
      Get.toNamed(Routes.OTP, arguments: {"is_signup" : true, "email" : emailController.text});
      Get.put(LoginController()).onInit();
    } else {
      CommonDialogue.alertActionDialogApp(message: model.message);
    }
  }

}
