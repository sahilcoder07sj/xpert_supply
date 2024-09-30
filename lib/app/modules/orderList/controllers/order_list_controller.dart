import 'package:tbd_flutter/app/modules/orderList/model/get_orders_model.dart';
import 'package:tbd_flutter/app/modules/orderList/model/update_order_status_model.dart';

import '../../../data/all.dart';
import '../../../data/utils.dart';

class OrderListController extends GetxController {

  ScrollController scrollController = ScrollController();
  RxList<Orders> orderList = RxList();
  Rxn<GetOrders> getOrders = Rxn<GetOrders>();
  RxString selectFilter = "Both Delivery".obs;
  RxString errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(onScroll);
    getOrdersAPI();
  }

  int pageLimit = 1;
  RxBool isPaginationLoading = false.obs;
  void onScroll() {
    if (scrollController.position.extentAfter <= 0 && orderList.length < (getOrders.value?.data?.totalOrders ?? 0) && !isPaginationLoading.value) {
      isPaginationLoading.value = true;
      pageLimit++;
      getOrdersAPI(isLoading: false);
    }
  }

  getOrdersAPI({bool isLoading = true, bool isReset = false}) async {
    errorMessage.value = "";
    try{
      if(isReset)pageLimit = 1;
      FormData formData = FormData.fromMap({
        "page" : pageLimit,
        "limit" : 10,
      });

      if(selectFilter.value != "Both Delivery"){
        formData.fields.add(
          MapEntry("is_fast_delivery", selectFilter.value == AppStrings.fastDelivery ? "1" : "0"),
        );
      }

      final data = await APIFunction().apiCall(
        apiName: Constants.getOrder,
        context: Get.context!,
        params: formData,
        isLoading: isLoading,
        token: GetStorageData().readString(GetStorageData().token),
      );

      GetOrders model = GetOrders.fromJson(data);

      if(model.status == 1){
        getOrders.value = model;
        if(isReset)orderList.clear();
        orderList.addAll(model.data?.orders ?? []);
        isPaginationLoading.value = false;
      } else{
        errorMessage.value = "No data found";
        CommonDialogue.alertActionDialogApp(message: model.message);
      }
    } catch(e){
      errorMessage.value = "No data found";
      print("error : $e");
    }
  }

  updateOrderStatus({required int orderId, required status}) async {
    FormData formData = FormData.fromMap({
      "order_id" : orderId,
      "status" : status,
    });

    final data = await APIFunction().apiCall(
      apiName: Constants.orderUpdateStatus,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    UpdateOrderStatus model = UpdateOrderStatus.fromJson(data);
    if(model.status == 1){
      Utils.flutterToast(model.message);
      update();
    } else{
      CommonDialogue.alertActionDialogApp(message: model.message);
    }
  }


}
