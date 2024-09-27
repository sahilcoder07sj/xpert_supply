import 'package:flutter/material.dart';
import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/category/model/categories_list_model.dart';

import '../../../data/all.dart';

class ConsumerProductsController extends GetxController {
  TextEditingController vendorCodeController = TextEditingController();

  bool isAddVendor = false;

  @override
  void onInit() {
    print(
        "GetStorageData().readString--->>>${GetStorageData().readString(GetStorageData().token)}");
    super.onInit();
  }


  getCategoriesApi() async {
    FormData formData = FormData.fromMap({});
    final data = await APIFunction().apiCall(
      apiName: Constants().categories,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    CategoryListModel loginUserModel = CategoryListModel.fromJson(data);
    if (loginUserModel.status == 1) {
      Utils.flutterToast(loginUserModel.message);
    } else {
      CommonDialogue.alertActionDialogApp(message: loginUserModel.message);
    }
  }

  addVendorApi() async {
    FormData formData = FormData.fromMap({});
    final data = await APIFunction().apiCall(
      apiName: Constants().categories,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    CategoryListModel loginUserModel = CategoryListModel.fromJson(data);
    if (loginUserModel.status == 1) {
      Utils.flutterToast(loginUserModel.message);
    } else {
      CommonDialogue.alertActionDialogApp(message: loginUserModel.message);
    }
  }
}
