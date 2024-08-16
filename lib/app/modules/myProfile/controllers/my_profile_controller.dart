import 'package:tbd_flutter/app/CommonWidget/common_botttom_sheet.dart';
import 'package:tbd_flutter/app/data/all.dart';

class MyProfileController extends GetxController {

  List<CommonModel> myProfileList = [
    CommonModel(title: AppStrings.editProfile, isCheck: true.obs),
    CommonModel(title: AppStrings.editDelivery, isCheck: Constants.selectUser == Constants.consumer ? false.obs : true.obs),
    CommonModel(title: AppStrings.orderHistory, isCheck: Constants.selectUser == Constants.consumer ? true.obs : false.obs),
    CommonModel(title: AppStrings.quate, isCheck: Constants.selectUser == Constants.consumer ? true.obs : false.obs),
    CommonModel(title: AppStrings.archived, isCheck: Constants.selectUser == Constants.consumer ? false.obs : true.obs),
    CommonModel(title: AppStrings.deleteAccount, isCheck: true.obs),
    CommonModel(title: AppStrings.signOut, isCheck: true.obs),
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
      case AppStrings.editDelivery:
        Get.toNamed(Routes.DELIVERY, arguments: {"is_check" : true});
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
        Get.toNamed(Routes.DELETE_ACCOUNT);
        break;
      case AppStrings.signOut:
        Get.bottomSheet(
          CommonBottomSheet(
            title: AppStrings.signOut,
            subTitle: AppStrings.areYouSureYouWantToSignOutFromApp,
            image: AppIcons.iconsLogoutBig,
          ),
        );
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
