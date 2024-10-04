import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tbd_flutter/app/CommonWidget/common_botttom_sheet.dart';
import 'all.dart';

class Utils {

  static void darkStatusBar({statusBarBrightness, statusBarIconBrightness}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: statusBarBrightness ?? Brightness.light,
      statusBarIconBrightness: statusBarIconBrightness ?? Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }

  static int countExit = 0;
   exitEvent() {
    countExit ++;
    Future.delayed(const Duration(seconds: 3),() {
      countExit = 0;
    },);
    if(countExit == 1) {
      Get.bottomSheet(
        CommonBottomSheet(
          title: AppStrings.exit,
          subTitle: AppStrings.areYouSureYouWantToSignOutFromApp,
          image: AppIcons.iconsLogoutBig,
          firstOnTap: () {
            exit(0);
          },
        ),
      );
    } else {
      exit(0);
    }
  }

  /// <<< To choose screens portrait --------- >>>
  static void screenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// <<< To check data, string, list, object are empty or not --------- >>>
  static bool isValidationEmpty(String? val) {
    if (val == null || val.isEmpty || val == "null" || val == "" || val == "NULL") {
      return true;
    } else {
      return false;
    }
  }

  /// <<< hide keyboard --------- >>>
  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static double calculateDiscountedPrice(double originalPrice, double discountPercentage) {
    if (discountPercentage < 0 || discountPercentage > 100) {
      throw ArgumentError('Discount percentage should be between 0 and 100');
    }
    double discountAmount = (discountPercentage / 100) * originalPrice;

    double finalPrice = originalPrice - discountAmount;

    return finalPrice;
  }

  static double calculatePercentage(double value, double total) {
    if (total == 0) {
      throw ArgumentError("Total cannot be zero");
    }
    return (value / total) * 100;
  }

  static flutterToast(text){
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primary,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  static showSnackBar({
    required String message,
  }) {
    Get.snackbar(
      "",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      titleText: const SizedBox(),
      borderRadius: 10,
      margin: const EdgeInsets.all(12),
      colorText: AppColors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      padding: const EdgeInsets.only(bottom: 15, top: 10, left: 15, right: 15),
      dismissDirection: DismissDirection.down,
      forwardAnimationCurve: Curves.easeInOut,
    );
  }
}

/// <<< Error Massage Red color --------- >>>
void printError(String text) {
  if(kDebugMode){
    if (Platform.isAndroid) {
      debugPrint('\x1B[31m$text\x1B[0m');
    } else {
      debugPrint(text);
    }
  }
}

/// <<< Ok Status Massage Green Color --------- >>>
void printOkStatus(String text) {
  if(kDebugMode){
    if (Platform.isAndroid) {
      debugPrint('\x1B[32m$text\x1B[0m');
    } else {
      debugPrint(text);
    }
  }
}

/// <<< Warning Massage Yellow Color --------- >>>
void printWarning(String text) {
  if(kDebugMode){
    if (Platform.isAndroid) {
      debugPrint('\x1B[33m$text\x1B[0m');
    } else {
      debugPrint(text);
    }
  }
}

/// <<< Action Massage Blue Color --------- >>>
void printAction(String text) {
  if(kDebugMode){
    if (Platform.isAndroid) {
      debugPrint('\x1B[34m$text\x1B[0m');
    } else {
      debugPrint(text);
    }
  }
}

/// <<< Cancel Massage Gray Color --------- >>>
void printCancel(String text) {
  if(kDebugMode){
    if (Platform.isAndroid) {
      debugPrint('\x1B[36m$text\x1B[0m');
    } else {
      debugPrint(text);
    }
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

SizedBox setVerticalSpacing(double height) =>
    SizedBox(height: height);

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    // Remove all existing non-digit characters
    final digitsOnly = newText.replaceAll(RegExp(r'\D'), '');

    final buffer = StringBuffer();
    int selectionIndex = newValue.selection.end;

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 3 || i == 6) {
        buffer.write(' ');
        if (i < selectionIndex) {
          selectionIndex++;
        }
      }
      buffer.write(digitsOnly[i]);
    }

    final formattedText = buffer.toString();
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}