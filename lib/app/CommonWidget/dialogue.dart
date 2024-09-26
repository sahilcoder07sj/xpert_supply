import 'dart:ui';

import 'package:tbd_flutter/app/data/utils.dart';

import '../data/all.dart';

class CommonDialogue{

  static alertActionDialogApp({
    String? message,
    String? okButtonName,
    bool isWidget = false,
    Widget? widget,
    bool? barrierDismissible,
    EdgeInsets? insetPadding,
    GestureTapCallback? okButtonClick,
    Color? textColor,
  }) async {
    Utils.hideKeyboard();
    showDialog(
        context: Get.context!,
        barrierColor: Colors.black45,
        barrierDismissible: barrierDismissible ?? true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: insetPadding ?? EdgeInsets.symmetric(horizontal: 40),
                  elevation: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          20.verticalSpace,
                          Container(
                            padding: EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.red.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                  Icons.close,
                                size: 60.0,
                                color: AppColors.red,
                              )
                          ),
                          20.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: isWidget ? widget : AppText(
                              textAlign: TextAlign.center,
                              message ?? "",
                              color: textColor ?? AppColors.primary,
                            ),
                          ),
                          20.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
                            child: CommonButton(
                              onTap: okButtonClick ?? () {
                                Get.back();
                              }, text: AppStrings.ok,
                            ),
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

}