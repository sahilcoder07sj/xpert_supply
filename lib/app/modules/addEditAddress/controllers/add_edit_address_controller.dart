import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEditAddressController extends GetxController {

  bool isEditAddress = false;
  TextEditingController houseNoController = TextEditingController();
  TextEditingController roanNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  void onInit() {
    if(Get.arguments != null){
      isEditAddress = Get.arguments["is_edit"];
    }
    super.onInit();
  }
}
