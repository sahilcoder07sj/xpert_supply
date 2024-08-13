import 'package:tbd_flutter/app/data/all.dart';

class MyProfileController extends GetxController {

  List<String> myProfileList = [
    AppStrings.editProfile,
    AppStrings.orderHistory,
    AppStrings.quate,
    AppStrings.deleteAccount,
    AppStrings.signOut,
  ];

  @override
  void onInit() {
    super.onInit();
  }

  onTapIndex(String title) {
    switch(title){
      case AppStrings.editProfile:
        Get.toNamed(Routes.EDIT_PROFILE);
        break;
      case AppStrings.orderHistory:
        Get.toNamed(Routes.ORDER_HISTORY);
        break;
      case AppStrings.quate:
        Get.toNamed(Routes.QUATE);
        break;
      case AppStrings.deleteAccount:
        Get.toNamed(Routes.DELETE_ACCOUNT);
        break;
      case AppStrings.signOut:
        break;
    }
  }

}

class CommonModel{
  String? title;
  String? subTitle;
  RxBool? isCheck;

  CommonModel({this.title, this.isCheck, this.subTitle});
}
