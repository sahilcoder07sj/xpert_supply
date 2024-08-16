import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {

  TextEditingController productNameController = TextEditingController(text: "Banana");
  TextEditingController amountNameController = TextEditingController(text: "\$399");
  TextEditingController discountNameController = TextEditingController(text: "\$250");
  TextEditingController descriptionNameController = TextEditingController(text: "A banana is the common name for a type of fruit and also the name for the herbaceous plants.");
  RxString selectImage = "".obs;

  @override
  void onInit() {
    super.onInit();
  }



}
