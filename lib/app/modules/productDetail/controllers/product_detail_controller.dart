import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/modules/category/model/categories_list_model.dart';
import 'package:tbd_flutter/app/modules/productDetail/model/add_to_cart_model.dart';
import 'package:tbd_flutter/app/modules/vendor_list/model/product_list_model.dart';

import '../../../data/all.dart';

class ProductDetailController extends GetxController {
  ProductsData? productsData;

  @override
  void onInit() {
    if (Get.arguments != null) {
      productsData = Get.arguments;
      print("productsData!.productId---->>>>>${productsData!.productId}");
      update();
    }
    super.onInit();
  }

  /// Add vendor
  addToCartApi() async {
    FormData formData = FormData.fromMap({
      "product_id": productsData!.productId,
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
      Get.toNamed(Routes.MY_CART);
    } else {
      CommonDialogue.alertActionDialogApp(message: addToCartModel.message);
    }
  }
}
