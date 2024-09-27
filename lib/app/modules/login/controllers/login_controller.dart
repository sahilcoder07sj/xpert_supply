import 'dart:io';

import 'package:tbd_flutter/app/CommonWidget/common_botttom_sheet.dart';
import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import '../../../data/all.dart';
import '../model/login_user_model.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController forgotEmailController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordHide = true.obs;
  RxBool isNewPasswordHide = true.obs;
  RxBool isConfirmPasswordHide = true.obs;
  String passEmail = "";

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments["email"] != null) {
        passEmail = Get.arguments["email"];
      }
    }
    super.onInit();
  }

  verifyOTPApi() async {
    FormData formData = FormData.fromMap({
      'email': passEmail,
      'otp': otpController.text,
      'is_forgot_password': Constants.isSignUp ? "0" : "1",
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().verifyOTP,
      context: Get.context!,
      params: formData,
      token: Constants.token,
    );
    LoginUserModel loginUserModel = LoginUserModel.fromJson(data);
    if (loginUserModel.status == 1) {
      otpController.clear();
      if (Constants.isSignUp) {
        Get.bottomSheet(
          CommonBottomSheet(
            title: AppStrings.congratulations,
            subTitle: AppStrings.youHaveSuccessfullyCreatedYourAccount,
            image: AppIcons.iconsRoundTick,
            isOneButton: true,
            singleButtonText: AppStrings.continueNew,
            commonOnTap: () {
              if (Constants.vendor == Constants.selectUser) {
                Get.offAllNamed(Routes.DELIVERY);
              } else {
                Get.offAllNamed(Routes.CONSUMER_PRODUCTS);
              }
            },
          ),
        );
      } else {
        Get.toNamed(Routes.RESET_PASSWORD);
      }
      update();
    } else {
      otpController.clear();
      update();
      CommonDialogue.alertActionDialogApp(message: loginUserModel.message);
    }
  }

  loginApi() async {
    FormData formData = FormData.fromMap({
      "email": emailController.text,
      "password": passwordController.text,
      "device_id": "EFGHI54321",
      "device_token": "ABCDEFGHITJKLMNOPQRSTUVWXYZ",
      "device_type": Platform.isAndroid ? "ANDROID" : "IOS"
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().login,
      context: Get.context!,
      params: formData,
    );
    LoginUserModel loginUserModel = LoginUserModel.fromJson(data);
    if (loginUserModel.status == 1) {
      await GetStorageData()
          .saveString(GetStorageData().token, loginUserModel.token);
      await GetStorageData()
          .saveObject(GetStorageData().userData, loginUserModel.data?.toJson());
      if (Constants.vendor == Constants.selectUser) {
        Get.offAllNamed(Routes.MANAGEMENT);
      } else {
        Get.offAllNamed(Routes.CONSUMER_PRODUCTS);
      }
    } else {
      CommonDialogue.alertActionDialogApp(message: data["message"]);
    }
  }

  bool validation({isForgotValidation = false}) {
    if (isForgotValidation
        ? forgotEmailController.text.isEmpty
        : emailController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterEmail);
      return false;
    } else if (!GetUtils.isEmail(isForgotValidation
        ? forgotEmailController.text
        : emailController.text)) {
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterValidEmail);
      return false;
    } else if (!isForgotValidation) {
      if (passwordController.text.isEmpty) {
        CommonDialogue.alertActionDialogApp(message: AppStrings.enterPassword);
        return false;
      } else if (!RegExp(Constants.passwordRegX)
          .hasMatch(passwordController.text)) {
        CommonDialogue.alertActionDialogApp(
            message: AppStrings.passwordValidation);
        return false;
      }
    }
    return true;
  }

  /// forgot password api
  forgotPasswordApi() async {
    FormData formData = FormData.fromMap({
      'email': forgotEmailController.text,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().forgotPassword,
      context: Get.context!,
      params: formData,
      token: Constants.token,
    );
    LoginUserModel loginUserModel = LoginUserModel.fromJson(data);
    if (loginUserModel.status == 1) {
      Constants.isSignUp = false;
      update();
      Get.toNamed(
        Routes.OTP,
        arguments: {
          "email": forgotEmailController.text,
        },
      );
      Get.put(LoginController()).onInit();
      Utils.flutterToast(loginUserModel.message);
    } else {
      CommonDialogue.alertActionDialogApp(message: loginUserModel.message);
    }
  }

  /// reset password validation
  resetPasswordValidation() {
    if (newPasswordController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterPassword);
      return false;
    } else if (!RegExp(Constants.passwordRegX)
        .hasMatch(newPasswordController.text)) {
      CommonDialogue.alertActionDialogApp(
          message: AppStrings.passwordValidation);
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(
          message: AppStrings.enterConfirmPassword);
      return false;
    } else if (newPasswordController.text != confirmPasswordController.text) {
      CommonDialogue.alertActionDialogApp(message: AppStrings.passwordNotMatch);
      return false;
    }
    return true;
  }

  /// reset password Api
  resetPasswordApi() async {
    FormData formData = FormData.fromMap({
      'password': newPasswordController.text,
      'password_confirmation': confirmPasswordController.text,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().resetPassword,
      context: Get.context!,
      params: formData,
      token: Constants.token,
    );
    LoginUserModel loginUserModel = LoginUserModel.fromJson(data);
    if (loginUserModel.status == 1) {
      Constants.isSignUp = false;
      update();
      Get.toNamed(
        Routes.OTP,
        arguments: {
          "email": forgotEmailController.text,
        },
      );
      Get.put(LoginController()).onInit();
      Utils.flutterToast(loginUserModel.message);
    } else {
      CommonDialogue.alertActionDialogApp(message: loginUserModel.message);
    }
  }
}
