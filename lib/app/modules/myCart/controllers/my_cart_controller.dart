import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/modules/myCart/model/my_cart_model.dart';
import 'package:tbd_flutter/app/modules/productDetail/model/add_to_cart_model.dart';
import 'package:tbd_flutter/app/modules/vendor_list/model/product_list_model.dart';

import '../../../data/all.dart';

class MyCartController extends GetxController {
  String noData = "";
  List<ProductsData> cartList = [];

  @override
  void onInit() {
    getMyCartApi();
    super.onInit();
  }

  getMyCartApi() async {
    noData = "";
    FormData formData = FormData.fromMap({});
    try {
      final data = await APIFunction().apiCall(
        apiName: Constants().customerCartGet,
        context: Get.context!,
        params: formData,
        token: GetStorageData().readString(GetStorageData().token),
      );
      MyCartModel myCartModel = MyCartModel.fromJson(data);
      if (myCartModel.status == 1) {
        if (myCartModel.data!.products!.isNotEmpty) {
          cartList = myCartModel.data!.products ?? [];
        } else {
          noData = "You have not added anything in the cart yet";
        }
        update();
      } else {
        noData = "You have not added anything in the cart yet";

        update();
        CommonDialogue.alertActionDialogApp(message: myCartModel.message);
      }
    } catch (e) {
      noData = "You have not added anything in the cart yet";
      update();
    }
  }

  addMinusQuantity(
      {String? productId,
      ProductsData? productsData,
      bool isMinus = false}) async {
    FormData formData = FormData.fromMap({
      "product_id": productId,
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
      if (isMinus) {
        productsData!.quantity = productsData!.quantity! - 1;
      } else {
        productsData!.quantity = productsData!.quantity! + 1;
      }
      update();
    } else {
      CommonDialogue.alertActionDialogApp(message: addToCartModel.message);
    }
  }
}
