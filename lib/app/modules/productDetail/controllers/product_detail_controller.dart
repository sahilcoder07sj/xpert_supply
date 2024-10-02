import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/modules/category/model/categories_list_model.dart';
import 'package:tbd_flutter/app/modules/productDetail/model/add_to_cart_model.dart';
import 'package:tbd_flutter/app/modules/vendor_list/model/product_list_model.dart';

import '../../../data/all.dart';
import 'package:tbd_flutter/app/modules/category/model/get_category_model.dart';
import 'package:tbd_flutter/app/modules/product/model/get_product_model.dart';
import 'package:tbd_flutter/app/modules/productDetail/model/single_product_details.dart';
import '../../../data/all.dart';
import '../../../data/utils.dart';

class ProductDetailController extends GetxController {

  Rxn<Products> products = Rxn<Products>();
  Rxn<SingleProductDetails> singleProductDetails = Rxn<SingleProductDetails>();
  CategoryData? getCategoryData;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      products.value = Get.arguments["details"];
      getCategoryData = Get.arguments["category_details"];
      getProduct();
    }
  }

  /// Add vendor
  addToCartApi({bool isOrderNow = false}) async {
    FormData formData = FormData.fromMap({
      "product_id": products.value!.productId,
      "quantity": '1',
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().addToCartProduct,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    AddToCartModel addToCartModel = AddToCartModel.fromJson(data);
    if (addToCartModel.status == 1) {
      if(isOrderNow){
        Get.offNamed(Routes.MY_ORDER);
      }else{
        Get.offNamed( Routes.MY_CART);
      }

    } else {
      CommonDialogue.alertActionDialogApp(message: addToCartModel.message);
    }
  }

  deleteProduct() async {
    Get.back();
    FormData formData = FormData.fromMap({
      "id": products.value?.productId ?? 0,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants.deleteProduct,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    if (data["status"] == 1) {
      Get.back(result: "delete");
      Utils.flutterToast(data["message"]);
    } else {
      CommonDialogue.alertActionDialogApp(message: data["message"]);
    }
  }

  getProduct() async {
    FormData formData = FormData.fromMap({
      "category_id": getCategoryData?.id ?? 0,
      "id": products.value?.productId ?? 0,
    });

    final data = await APIFunction().apiCall(
      apiName: Constants.getProduct,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    SingleProductDetails model = SingleProductDetails.fromJson(data);
    if (model.status == 1) {
      singleProductDetails.value = model;
    }
  }
}
