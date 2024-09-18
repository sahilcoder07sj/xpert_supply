import 'package:tbd_flutter/app/CommonWidget/common_botttom_sheet.dart';
import 'package:tbd_flutter/app/api_repository/api_function.dart';
import '../../../data/all.dart';

class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgotEmailController = TextEditingController();
  String otp = "";
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordHide = true.obs;
  RxBool isNewPasswordHide = true.obs;
  RxBool isConfirmPasswordHide = true.obs;
  String passEmail = "";

  @override
  void onInit() {
    if(Get.arguments != null){
      if(Get.arguments["email"] != null){
        passEmail = Get.arguments["email"];
      }
    }
    super.onInit();
  }

  sendOtpApi() async {
    FormData formData = FormData.fromMap({
      'email': passEmail,
      'otp': otp,
      'is_forgot_password': Constants.isSignUp ? "0" : "1",
    });
    final data = await APIFunction().apiCall(
      apiName: Constants.vendorVerifyOTP,
      context: Get.context!,
      params: formData,
      token: Constants.token,
    );

    if(data["status"] == 1){
      Get.bottomSheet(
        CommonBottomSheet(
          title: AppStrings.congratulations,
          subTitle: AppStrings.youHaveSuccessfullyCreatedYourAccount,
          image: AppIcons.iconsRoundTick,
          isOneButton: true,
          singleButtonText: AppStrings.continueNew,
          commonOnTap: () {
            if(Constants.vendor == Constants.selectUser){
              Get.offAllNamed(Routes.DELIVERY);
            } else{
              Get.offAllNamed(Routes.CONSUMER_PRODUCTS);
            }
          },
        ),
      );
    } else{
      CommonDialogue.alertActionDialogApp(message: data["message"]);
    }

  }

}
