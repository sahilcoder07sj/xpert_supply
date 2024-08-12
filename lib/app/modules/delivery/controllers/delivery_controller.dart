import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeliveryController extends GetxController {

  TextEditingController normalDeliveryDaysController = TextEditingController();
  TextEditingController fastDeliveryDaysController = TextEditingController();
  TextEditingController fastDeliveryChargesController = TextEditingController();
  RxBool isFastDelivery = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

}
