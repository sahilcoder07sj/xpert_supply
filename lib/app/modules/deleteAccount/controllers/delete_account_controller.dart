import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/modules/myProfile/controllers/my_profile_controller.dart';

class DeleteAccountController extends GetxController {

  TextEditingController messageController = TextEditingController();
  List<CommonModel> deleteList = [
    CommonModel(title: AppStrings.iAmUsingDifferentAccount, isCheck: false.obs),
    CommonModel(title: AppStrings.theAppIsNotWorkingProperly, isCheck: false.obs),
    CommonModel(title: AppStrings.imWorriedAboutMyPrivacy, isCheck: false.obs),
    CommonModel(title: AppStrings.noOneReplies, isCheck: false.obs),
    CommonModel(title: AppStrings.other, isCheck: false.obs),
  ];

  @override
  void onInit() {
    super.onInit();
  }

}
