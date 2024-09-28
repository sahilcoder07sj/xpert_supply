import 'package:flutter/cupertino.dart';

import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/modules/login/model/login_user_model.dart';

import '../../../data/all.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  LoginUserData? loginUserData;

  @override
  void onInit() {
    if (GetStorageData().readObject(GetStorageData().userData) != null) {
      loginUserData = LoginUserData.fromJson(
          (GetStorageData().readObject(GetStorageData().userData)));
      nameController.text = loginUserData!.name ?? "";
      emailController.text = loginUserData!.email ?? "";
      if (GetStorageData().readObject(GetStorageData().userData)["vendor_no"] !=
          null) {
        companyNameController.text = loginUserData!.businessName ?? "";
      }
    }
    super.onInit();
  }

  addEditProfile() async {
    FormData formData = FormData.fromMap({
      "email": emailController.text,
      "name": nameController.text,
      "business_name": companyNameController.text,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().updateProfile,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    LoginUserModel loginUserModel = LoginUserModel.fromJson(data);
    if (loginUserModel.status == 1) {
      await GetStorageData()
          .saveObject(GetStorageData().userData, loginUserModel.data!.toJson());
      Get.back();
    } else {
      CommonDialogue.alertActionDialogApp(message: loginUserModel.message);
    }
  }

  bool validation() {
    if (nameController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterName);
      return false;
    } else if (emailController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterEmail);
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterValidEmail);
      return false;
    } else if (Constants.selectUser == Constants.vendor) {
      if (companyNameController.text.isEmpty) {
        CommonDialogue.alertActionDialogApp(
            message: AppStrings.enterBusinessName);
        return false;
      }
    }
    return true;
  }
}
