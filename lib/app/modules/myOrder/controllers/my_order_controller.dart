import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/modules/addEditAddress/model/add_edit_address_model.dart';
import 'package:tbd_flutter/app/modules/addEditAddress/model/address_list_model.dart';
import 'package:tbd_flutter/app/modules/myCart/model/my_cart_model.dart';
import 'package:tbd_flutter/app/modules/myOrder/model/my_order_model.dart';
import 'package:tbd_flutter/app/modules/productDetail/model/add_to_cart_model.dart';
import 'package:tbd_flutter/app/modules/vendor_list/model/product_list_model.dart';

import '../../../data/all.dart';

class MyOrderController extends GetxController {
  List<AddEditAddressData> addressList = [];
  List<ProductsData> cartProducts = [];
  RxInt tempQty = 0.obs;
  int? cartId;
  int? addressId;
  RxBool isOpenAllAddress = false.obs;
  RxBool isFastDelivery = false.obs;
  TextEditingController noteController = TextEditingController();

  @override
  void onInit() {
    getMyCartApi();
    getAddress();
    getDeliveryCharges();
    super.onInit();
  }

  /// get all address
  getAddress() async {
    FormData formData = FormData.fromMap({});

    final data = await APIFunction().apiCall(
      apiName: Constants().getAddress,
      context: Get.context!,
      params: formData,
      isLoading: false,
      token: GetStorageData().readString(GetStorageData().token),
    );
    AddressModel addressModel = AddressModel.fromJson(data);
    if (addressModel.status == 1) {
      addressList = addressModel.data ?? [];
      if (addressList.isNotEmpty) {
        addressId = addressList.first.id;
      }
      update();
    } else {
      CommonDialogue.alertActionDialogApp(message: addressModel.message);
    }
  }

  /// add delete address
  deleteAddress({int? addressId}) async {
    FormData formData = FormData.fromMap({
      "id": addressId,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().deleteAddress,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    AddEditAddressModel addToCartModel = AddEditAddressModel.fromJson(data);
    if (addToCartModel.status == 1) {
      for (int i = 0; i < addressList.length; i++) {
        if (addressList[i].id == addressId) {
          Get.back();
          addressList.removeAt(i);
          break;
        }
      }
      update();
    } else {
      CommonDialogue.alertActionDialogApp(message: addToCartModel.message);
    }
  }

  /// cart product Quantity
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
        productsData!.quantity = productsData.quantity! - 1;
      } else {
        productsData!.quantity = productsData.quantity! + 1;
      }
      update();
    } else {
      CommonDialogue.alertActionDialogApp(message: addToCartModel.message);
    }
  }

  /// my cart
  getMyCartApi() async {
    FormData formData = FormData.fromMap({});
    final data = await APIFunction().apiCall(
      apiName: Constants().customerCartGet,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    MyCartModel myCartModel = MyCartModel.fromJson(data);
    if (myCartModel.status == 1) {
      cartProducts = myCartModel.data!.products ?? [];
      cartId = myCartModel.data!.cartId;
      update();
    } else {
      CommonDialogue.alertActionDialogApp(message: myCartModel.message);
    }
  }

  /// Place order api
  placeOrder() async {
    FormData formData = FormData.fromMap({
      "cart_id": cartId,
      "delivery_address_id": addressId,
      "is_fast_delivery": isFastDelivery.value ? "1" : "0",
      "delivery_charges": deliveryData != null
          ? deliveryData!.fastDeliveryCharges.toString()
          : "0",
      "delivery_date": deliveryData != null
          ? isFastDelivery.value
              ? deliveryData!.fastDeliveryDate
              : deliveryData!.normalDeliveryDate
          : "",
      if (noteController.text.isNotEmpty) "notes": noteController.text,
      "payment_id": "ABC123456"
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().placeOrder,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    MyCartModel addToCartModel = MyCartModel.fromJson(data);
    if (addToCartModel.status == 1) {
      Get.toNamed(Routes.ORDER_CONFIRM);
    } else {
      CommonDialogue.alertActionDialogApp(message: addToCartModel.message);
    }
  }

  /// get delivery data
  DeliveryData? deliveryData;

  getDeliveryCharges() async {
    FormData formData = FormData.fromMap({
      "vendor_id": "1",
    });
    final data = await APIFunction().apiCall(
      apiName: Constants().getDelivery,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    DeliveryModel deliveryModel = DeliveryModel.fromJson(data);
    if (deliveryModel.status == 1) {
      if (deliveryModel.data != null) {
        deliveryData = deliveryModel.data;
      }
      update();
    } else {
      CommonDialogue.alertActionDialogApp(message: deliveryModel.message);
    }
  }
}
