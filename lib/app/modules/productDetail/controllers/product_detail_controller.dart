import 'package:tbd_flutter/app/modules/category/model/get_category_model.dart';
import 'package:tbd_flutter/app/modules/product/model/get_product_model.dart';
import 'package:tbd_flutter/app/modules/productDetail/model/single_product_details.dart';
import '../../../data/all.dart';
import '../../../data/utils.dart';

class ProductDetailController extends GetxController {

  Rxn<Products> products = Rxn<Products>();
  Rxn<SingleProductDetails> singleProductDetails = Rxn<SingleProductDetails>();
  GetCategoryData? getCategoryData;

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      products.value = Get.arguments["details"];
      getCategoryData = Get.arguments["category_details"];
      getProduct();
    }
  }

  deleteProduct() async {
    Get.back();
    FormData formData = FormData.fromMap({
      "id" : products.value?.productId ?? 0,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants.deleteProduct,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    if(data["status"] == 1){
      Get.back(result: "delete");
      Utils.flutterToast(data["message"]);
    } else{
      CommonDialogue.alertActionDialogApp(message: data["message"]);
    }
  }

  getProduct() async {
    FormData formData = FormData.fromMap({
      "category_id" : getCategoryData?.id ?? 0,
      "id" : products.value?.productId ?? 0,
    });

    final data = await APIFunction().apiCall(
      apiName: Constants.getProduct,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    SingleProductDetails model = SingleProductDetails.fromJson(data);
    if(model.status == 1){
      singleProductDetails.value = model;
    }
  }
}
