import 'dart:ui';

import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/modules/quate/model/quote_list_model.dart';

import '../../../api_repository/get_storage.dart';

class QuateController extends GetxController {
  List<QuoteHistoryData> quoteHistoryData = [];
  RxInt selectIndex = 10.obs;
  TextEditingController amountController = TextEditingController();

  @override
  void onInit() {
    getQuoteHistoryApi();
    super.onInit();
  }

  String noData = "";

  sendOfferDialogue() {
    showDialog(
      context: Get.context!,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.0,
          sigmaY: 3.0,
        ),
        child: Dialog(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 22.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextFormField(
                  title: AppStrings.sendOffer,
                  controller: amountController,
                  prefixIcon: AppIcons.iconsAmount,
                  hintText: AppStrings.amount,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                25.verticalSpace,
                CommonButton(
                    text: AppStrings.send,
                  onTap: () => Get.back(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getQuoteHistoryApi() async {
    FormData formData = FormData.fromMap({});
    try {
      final data = await APIFunction().apiCall(
        apiName: Constants().quoteHistory,
        context: Get.context!,
        params: formData,
        token: GetStorageData().readString(GetStorageData().token),
      );
      QuoteHistoryModel orderHistoryModel = QuoteHistoryModel.fromJson(data);
      if (orderHistoryModel.status == 1) {

        if (orderHistoryModel.data!.isNotEmpty) {
          quoteHistoryData = orderHistoryModel.data ?? [];

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

