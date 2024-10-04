import 'dart:ui';

import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/modules/quate/model/quote_list_model.dart';

import '../../../api_repository/get_storage.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/quate/model/get_quote_model.dart';
import 'package:tbd_flutter/app/modules/quate/model/manage_order_model.dart';

class QuateController extends GetxController {
  RxList<QuoteHistoryData> quoteHistoryData = RxList();
  RxInt selectIndex = 10.obs;
  TextEditingController amountController = TextEditingController();
  RxList<GetQuoteData> quoteList = RxList();
  RxBool isPaginationLoading = false.obs;
  ScrollController scrollController = ScrollController();
  Rxn<GetQuote> getQuoteModel = Rxn<GetQuote>();
  RxString errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    if (Constants.selectUser == Constants.vendor) {
      scrollController.addListener(onScroll);
      getQuote();
    } else {
      getQuoteHistoryApi();
    }
  }

  sendOfferDialogue({required int quoteId, required int index}) {
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
                  maxLength: 6,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                25.verticalSpace,
                CommonButton(
                  text: AppStrings.send,
                  onTap: () {
                    if(amountController.text.isEmpty){
                      CommonDialogue.alertActionDialogApp(message: AppStrings.pleaseEnterOfferAmount);
                    } else{
                      manageQuote(
                          index: index,
                          quoteId: quoteId,
                          isSend: true,
                          offerPrice: int.parse(amountController.text));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onScroll() {
    if (Constants.selectUser == Constants.vendor) {
      if (scrollController.position.extentAfter <= 0 &&
          quoteList.length < (getQuoteModel.value?.pagination?.total ?? 0) &&
          !isPaginationLoading.value) {
        isPaginationLoading.value = true;
        currentPage++;
        getQuote(isLoading: false);
      }
    }
  }

  int currentPage = 1;

  getQuote({bool isLoading = true}) async {
    errorMessage.value = "";
    // try {
    FormData formData = FormData.fromMap({
      "page": currentPage,
      "limit": 10,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants.getQuoteHistory,
      context: Get.context!,
      params: formData,
      isLoading: isLoading,
      token: GetStorageData().readString(GetStorageData().token),
    );

    GetQuote model = GetQuote.fromJson(data);
    if (model.status == 1) {
      quoteList.addAll(model.data ?? []);
      isPaginationLoading.value = false;
    } else {
      errorMessage.value = "No data found";
      // CommonDialogue.alertActionDialogApp(message: model.message);
    }
    // } catch (e) {
    //   errorMessage.value = "No data found";
    //   print("error : $e");
    // }
  }

  manageQuote(
      {int? offerPrice,
      required quoteId,
      required bool isSend,
      int? index}) async {
    try {
      if(isSend && double.parse(quoteList[index!].totalPrice ?? "") <= double.parse(amountController.text)){
        CommonDialogue.alertActionDialogApp(message: AppStrings.offerPriceShouldBeLessThan);
      } else{
        FormData formData = FormData.fromMap({
          "quote_id": quoteId,
          "action": isSend ? "send_offer" : "cancel_offer",
          // "message" : "",
        });

        if (offerPrice != null) {
          formData.fields.add(MapEntry("offer_price", offerPrice.toString()));
        }
        final data = await APIFunction().apiCall(
          apiName: Constants.manageOffer,
          context: Get.context!,
          params: formData,
          token: GetStorageData().readString(GetStorageData().token),
        );

        ManageOrder model = ManageOrder.fromJson(data);
        if (model.status == 1) {
          if (isSend == true) {
            amountController.clear();
            Get.back();
            quoteList[index!].status = "offered";
          } else {
            quoteList[index!].status = "canceled";
          }
          quoteList.refresh();
          Utils.flutterToast(model.message);
        } else {
          CommonDialogue.alertActionDialogApp(message: model.message);
        }
      }
    } catch (e) {
      print("error : $e");
    }
  }

  getQuoteHistoryApi() async {
    errorMessage.value = "";
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
          quoteHistoryData.value = orderHistoryModel.data ?? [];
        } else {
          errorMessage.value = "No product found in cart";
        }
        update();
      } else {
        errorMessage.value = "No product found in cart";

        update();
        // CommonDialogue.alertActionDialogApp(message: orderHistoryModel.message);
      }
    } catch (e) {
      errorMessage.value = "No product found in cart";
      update();
    }
  }

  customerManageQuote(
      {bool isAccepted = false, String? quoteId, int? index}) async {
    try {
      FormData formData = FormData.fromMap({
        "quote_id": quoteId,
        "action": isAccepted ? "accept_offer" : "reject_offer",
      });

      final data = await APIFunction().apiCall(
        apiName: Constants.customerManageQuote,
        context: Get.context!,
        params: formData,
        token: GetStorageData().readString(GetStorageData().token),
      );

      ManageOrder model = ManageOrder.fromJson(data);
      if (model.status == 1) {
        if (!isAccepted) {
          quoteHistoryData[index!].status = "rejected";
        }
        if (isAccepted) {
          quoteHistoryData[index!].status = "accepted";
        }
        quoteHistoryData.refresh();
        Utils.flutterToast(model.message);
      } else {
        CommonDialogue.alertActionDialogApp(message: model.message);
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
