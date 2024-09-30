import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/modules/orderHistory/model/order_history_model.dart';

import '../../../data/all.dart';

class OrderHistoryController extends GetxController {
  List<OrderHistoryData> orderHistoryData = [];
  RxInt selectIndex = 10.obs;

  @override
  void onInit() {
    getOrderHistoryApi();
    super.onInit();
  }

  String noData = "";

  getOrderHistoryApi() async {
    FormData formData = FormData.fromMap({});
    try {
      final data = await APIFunction().apiCall(
        apiName: Constants().orderHistory,
        context: Get.context!,
        params: formData,
        token: GetStorageData().readString(GetStorageData().token),
      );
      OrderHistoryModel orderHistoryModel = OrderHistoryModel.fromJson(data);
      if (orderHistoryModel.status == 1) {

        if (orderHistoryModel.data!.isNotEmpty) {
          orderHistoryData = orderHistoryModel.data ?? [];
          print("orderHistoryData.length---->>>>${orderHistoryData.length}");
        } else {
          noData = "No product found in cart";
        }
        update();
      } else {
        noData = "No product found in cart";

        update();
        CommonDialogue.alertActionDialogApp(message: orderHistoryModel.message);
      }
    } catch (e) {
      noData = "No product found in cart";
      update();
    }
  }
}
