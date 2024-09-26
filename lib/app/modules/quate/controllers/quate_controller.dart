import 'dart:ui';

import 'package:tbd_flutter/app/data/all.dart';

class QuateController extends GetxController {

  RxInt selectIndex = 10.obs;
  TextEditingController amountController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

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
}

