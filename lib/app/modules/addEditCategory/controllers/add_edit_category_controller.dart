import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEditCategoryController extends GetxController {
  TextEditingController categoryController = TextEditingController();
  bool isEdit = false;

  @override
  void onInit() {
    print("Get.arguments-----${Get.arguments}");
    if (Get.arguments != null) {
      isEdit = Get.arguments["is_edit"];
      print("isEdit --- Get.arguments $isEdit");
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
