import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/category/model/categories_list_model.dart';

import '../../../data/all.dart';

class VendorCategoriesListController extends GetxController {
  List<CategoryData> vendorCategoriesData = [];
  String noData = '';
  String vendorCode = '';
  String vendorName = '';

  @override
  void onInit() {
    if (Get.arguments != null) {
      vendorCode = Get.arguments["vendor_code"];
      vendorName = Get.arguments["vendor_name"];
      getCategoriesApi(vendorCode: vendorCode);
    }
    super.onInit();
  }

  getCategoriesApi({String? vendorCode}) async {
    FormData formData = FormData.fromMap({
      "vendor_no": vendorCode,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().categories,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    CategoryListModel categoryListModel = CategoryListModel.fromJson(data);
    if (categoryListModel.status == 1) {
      if (categoryListModel.data!.isNotEmpty) {
        vendorCategoriesData = categoryListModel.data ?? [];
      } else {
        noData = "No vendor available";
      }
      update();
    } else {
      CommonDialogue.alertActionDialogApp(message: categoryListModel.message);
    }
  }
}
