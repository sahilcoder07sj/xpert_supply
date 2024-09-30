import 'package:flutter/cupertino.dart';
import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/modules/addEditAddress/model/add_edit_address_model.dart';

import '../../../data/all.dart';

class AddEditAddressController extends GetxController {
  bool isEditAddress = false;
  TextEditingController houseNoController = TextEditingController();
  TextEditingController roanNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  AddEditAddressData? addressData;

  @override
  void onInit() {
    if (Get.arguments != null) {
      isEditAddress = Get.arguments["is_edit"];
      addressData = Get.arguments["address_data"];
      houseNoController.text = addressData!.address ?? "";
      roanNameController.text = addressData!.area ?? "";
      cityController.text = addressData!.city ?? "";
      countryController.text = addressData!.country ?? "";
      pincodeController.text = addressData!.pincode ?? "";
    }
    super.onInit();
  }

  addEditAddress() async {
    FormData formData = FormData.fromMap({
      "address": houseNoController.text,
      "area": roanNameController.text,
      "city": cityController.text,
      "country": countryController.text,
      "pincode": pincodeController.text,
      "id": isEditAddress ? addressData!.id : ""
    });
    final data = await APIFunction().apiCall(
      apiName: isEditAddress ? Constants().editAddress : Constants().addAddress,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    AddEditAddressModel addToCartModel = AddEditAddressModel.fromJson(data);
    if (addToCartModel.status == 1) {
      Get.back(result: addToCartModel.data);
    } else {
      CommonDialogue.alertActionDialogApp(message: addToCartModel.message);
    }
  }

  addressValidation() {
    if (houseNoController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(
          message: "Please enter house number and address");
      return false;
    } else if (roanNameController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(
          message: "Please enter house number and address");
      return false;
    } else if (cityController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(message: "Please enter city");
      return false;
    } else if (countryController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(message: "Please enter country");
      return false;
    } else if (pincodeController.text.isEmpty) {
      CommonDialogue.alertActionDialogApp(message: "Please enter pinCode");
      return false;
    }
    return true;
  }
}
