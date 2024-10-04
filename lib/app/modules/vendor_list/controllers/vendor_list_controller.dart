import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/category/model/categories_list_model.dart';

import '../../../data/all.dart';
import '../model/vendor_list_model.dart';

class VendorListController extends GetxController {
  TextEditingController vendorCodeController = TextEditingController();

  bool isAddVendor = false;
  List<VendorListData> vendorList = [];
  String noData = '';

  @override
  void onInit() {
    getVendorApi();
    super.onInit();
  }



  /// Get All Vendor
  getVendorApi() async {
    FormData formData = FormData.fromMap({});
    final data = await APIFunction().apiCall(
      apiName: Constants().vendorHistory,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    VendorListModel vendorListModel = VendorListModel.fromJson(data);
    if (vendorListModel.status == 1) {
      if (vendorListModel.data!.isNotEmpty) {
        vendorList = vendorListModel.data ?? [];
      } else {
        isAddVendor = true;
        noData = "No vendor available";
      }
      update();
    } else {
      noData = "No vendor available";
      CommonDialogue.alertActionDialogApp(message: vendorListModel.message);
    }
  }

  /// Add vendor
  addVendorApi() async {
    FormData formData = FormData.fromMap({
      "vendor_no": vendorCodeController.text,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().categories,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    CategoryListModel categoryListModel = CategoryListModel.fromJson(data);
    if (categoryListModel.status == 1) {
      isAddVendor = false;
      getVendorApi();
    } else {
      CommonDialogue.alertActionDialogApp(message: categoryListModel.message);
    }
  }

  /// back method when user adding vendor
  backMethod() {
    if (vendorList.isEmpty) {
      Utils().exitEvent();
    } else {
      if (isAddVendor) {
        isAddVendor = false;
        update();
      } else {
        Utils().exitEvent();
      }
    }
  }
}
