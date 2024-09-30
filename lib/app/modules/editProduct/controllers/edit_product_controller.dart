import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/editProduct/model/edit_product_model.dart';
import 'package:tbd_flutter/app/modules/product/controllers/product_controller.dart';
import 'package:tbd_flutter/app/modules/productDetail/model/single_product_details.dart';
import '../../../data/all.dart';

class EditProductController extends GetxController {

  TextEditingController productNameController = TextEditingController();
  TextEditingController amountNameController = TextEditingController();
  TextEditingController discountNameController = TextEditingController();
  TextEditingController descriptionNameController = TextEditingController();
  RxString selectImage = "".obs;
  Rxn<SingleProductDetails> singleProductDetails = Rxn<SingleProductDetails>();

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      singleProductDetails.value = Get.arguments["details"];
      productNameController.text = singleProductDetails.value?.data?.name ?? "";
      amountNameController.text = singleProductDetails.value?.data?.amount != null && singleProductDetails.value?.data?.amount != 0 ? singleProductDetails.value?.data?.amount.toString() ?? "" : "";
      discountNameController.text = singleProductDetails.value?.data?.discount != null && singleProductDetails.value?.data?.discount != 0 ? singleProductDetails.value?.data?.discount.toString() ?? "" : "";
      descriptionNameController.text = singleProductDetails.value?.data?.description ?? "";
    }
  }

  bool validation(){
    if(productNameController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.pleaseEnterProductName);
      return false;
    } else if(amountNameController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.pleaseEnterAmount);
      return false;
    } else if(discountNameController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.pleaseEnterDiscount);
      return false;
    } else if(descriptionNameController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.pleaseEnterDescription);
      return false;
    }
    return true;
  }

  updateProduct() async {
    if(validation()){
      FormData formData = FormData.fromMap({
        "category_id" : Get.find<ProductController>().getCategory.value?.data?.categoryId ?? "",
        "name" : productNameController.text,
        "amount" : int.parse(amountNameController.text),
        "description" : descriptionNameController.text,
        "id" : singleProductDetails.value?.data?.productId ?? 0,
        "discount" : int.parse(discountNameController.text),
        "status" : 1,
      });

      if(selectImage.value.isNotEmpty){
        formData.files.add(
          MapEntry(
            "images",
            await MultipartFile.fromFile(selectImage.value, filename: selectImage.value.split("/").last),
          )
        );
      }

      final data = await APIFunction().apiCall(
        apiName: Constants.updateProduct,
        context: Get.context!,
        params: formData,
        token: GetStorageData().readString(GetStorageData().token),
      );

      EditProduct model = EditProduct.fromJson(data);
      if(model.status == 1){
        Get.back(result: "edit_product");
        Utils.flutterToast(data["message"]);
      } else{
        CommonDialogue.alertActionDialogApp(message: data["message"]);
      }
    }
  }

}
