import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productAmountController = TextEditingController();
    TextEditingController productDiscountController = TextEditingController();
    TextEditingController productDescriptionController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}
