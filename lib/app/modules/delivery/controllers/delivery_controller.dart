import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeliveryController extends GetxController {

  TextEditingController normalDeliveryDaysController = TextEditingController();
  TextEditingController fastDeliveryDaysController = TextEditingController();
  TextEditingController fastDeliveryChargesController = TextEditingController();
  bool isUpdate = false;
  RxBool isFastDelivery = false.obs;

  @override
  void onInit() {
    if(Get.arguments != null){
      isUpdate = Get.arguments["is_check"];
    }
    super.onInit();
  }

}
