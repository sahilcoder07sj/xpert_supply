import 'package:tbd_flutter/app/modules/login/model/login_user_model.dart';

import '../../../data/all.dart';

class ManagementController extends GetxController {

  Rxn<LoginUserData> vendorModel = Rxn<LoginUserData>();

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  getProfile() async {
    FormData formData = FormData.fromMap({});
    final data = await APIFunction().apiCall(
      apiName: Constants.getProfile,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    LoginUserModel model = LoginUserModel.fromJson(data);
    if(model.status == 1){
      vendorModel.value = model.data;
    }
  }

}
