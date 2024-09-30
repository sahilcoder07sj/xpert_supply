import 'package:flutter/cupertino.dart';
import 'package:tbd_flutter/app/api_repository/api_function.dart';

import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/login/model/login_user_model.dart';

import '../../../api_repository/get_storage.dart';

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

  changePasswordValidation() {
    if (currentPasswordController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(
          message: AppStrings.pleaseEnterCurrentPassword);
      return false;
    } else if (newPasswordController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterPassword);
      return false;
    } else if (!RegExp(Constants.passwordRegX)
        .hasMatch(newPasswordController.text)) {
      CommonDialogue.alertActionDialogApp(
          message: AppStrings.passwordValidation);
      return false;
    } else if (confirmNewController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(
          message: AppStrings.enterConfirmPassword);
      return false;
    } else if (newPasswordController.text != confirmNewController.text) {
      CommonDialogue.alertActionDialogApp(message: AppStrings.passwordNotMatch);
      return false;
    }
    return true;
  }

  changePasswordApi() async {
    FormData formData = FormData.fromMap({
      "password": currentPasswordController.text,
      "new_password": newPasswordController.text,
      "new_password_confirmation": confirmNewController.text,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().changePassword,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    LoginUserModel loginUserModel = LoginUserModel.fromJson(data);
    if (loginUserModel.status == 1) {
      Get.back();
      Utils.flutterToast(loginUserModel.message);
    } else {
      CommonDialogue.alertActionDialogApp(message: loginUserModel.message);
    }
  }
}
