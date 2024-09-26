import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {

  RxInt tempQty = 0.obs;
  RxBool isOpenAllAddress = false.obs;
  RxBool isFastDelivery = false.obs;
  TextEditingController noteController = TextEditingController();

}
