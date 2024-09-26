import 'package:tbd_flutter/app/CommonWidget/common_botttom_sheet.dart';
import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/modules/login/model/login_user_model.dart';

class MyProfileController extends GetxController {
  List<CommonModel> myProfileList = [
    CommonModel(title: AppStrings.editProfile, isCheck: true.obs),
    CommonModel(
        title: AppStrings.editDelivery,
        isCheck:
            Constants.selectUser == Constants.consumer ? false.obs : true.obs),
    CommonModel(
        title: AppStrings.orderHistory,
        isCheck:
            Constants.selectUser == Constants.consumer ? true.obs : false.obs),
    CommonModel(
        title: AppStrings.quate,
        isCheck:
            Constants.selectUser == Constants.consumer ? true.obs : false.obs),
    CommonModel(
        title: AppStrings.archived,
        isCheck:
            Constants.selectUser == Constants.consumer ? false.obs : true.obs),
    CommonModel(title: AppStrings.deleteAccount, isCheck: true.obs),
    CommonModel(title: AppStrings.signOut, isCheck: true.obs),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  onTapIndex(String title) {
    switch (title) {
      case AppStrings.editProfile:
        Get.toNamed(Routes.EDIT_PROFILE);
        break;
      case AppStrings.editDelivery:
        Get.toNamed(Routes.DELIVERY, arguments: {"is_check": true});
        break;
      case AppStrings.orderHistory:
        Get.toNamed(Routes.ORDER_HISTORY);
        break;
      case AppStrings.archived:
        Get.toNamed(Routes.ARCHIVED);
        break;
      case AppStrings.quate:
        Get.toNamed(Routes.QUATE);
        break;
      case AppStrings.deleteAccount:
        Get.bottomSheet(
          CommonBottomSheet(
            title: AppStrings.deleteMyAccount,
            subTitle: AppStrings.areYouSureYouWantToDeleteYourAccount,
            image: AppIcons.iconsDeleteBig,
            iconBgColor: AppColors.red.withOpacity(0.1),
            firstOnTap: () {
              deleteAccountApi();
            },
          ),
        );
        break;
      case AppStrings.signOut:
        Get.bottomSheet(
          CommonBottomSheet(
            title: AppStrings.signOut,
            subTitle: AppStrings.areYouSureYouWantToSignOutFromApp,
            image: AppIcons.iconsLogoutBig,
            firstOnTap: () {
              logoutApi();
            },
          ),
        );
        break;
    }
  }

  logoutApi() async {
    FormData formData = FormData.fromMap({});
    final data = await APIFunction().apiCall(
      apiName: Constants().logout,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    LoginUserModel loginUserModel = LoginUserModel.fromJson(data);
    if (loginUserModel.status == 1) {
      await GetStorageData().removeData(GetStorageData().token);
      await GetStorageData().removeData(GetStorageData().userData);
      Get.offAllNamed(Routes.SELECT_USER);
    } else {
      CommonDialogue.alertActionDialogApp(message: data["message"]);
    }
  }

  deleteAccountApi() async {
    FormData formData = FormData.fromMap({
      "delete_reason": "delete the account",
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().deleteAccount,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    LoginUserModel loginUserModel = LoginUserModel.fromJson(data);
    if (loginUserModel.status == 1) {
      await GetStorageData().removeData(GetStorageData().token);
      await GetStorageData().removeData(GetStorageData().userData);
      Get.offAllNamed(Routes.SELECT_USER);
    } else {
      CommonDialogue.alertActionDialogApp(message: loginUserModel.message);
    }
  }
}

class CommonModel {
  String? title;
  String? subTitle;
  RxBool? isCheck;

  CommonModel({this.title, this.isCheck, this.subTitle});
}
