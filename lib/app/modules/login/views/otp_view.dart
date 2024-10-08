import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tbd_flutter/app/modules/login/controllers/login_controller.dart';
import '../../../data/all.dart';

class OtpView extends GetView<LoginController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 60.0),
              CommonWidget.roundIconWidget(imageName: AppIcons.iconsOtpBig),
              13.verticalSpace,
              AppText(
                AppStrings.oTPAuthentication,
                fontSize: 26.0,
                fontFamily: FontFamily.semiBold,
              ),
              5.verticalSpace,
              AppText(
                AppStrings.enterTheVerificationCodeWeJust,
                fontSize: 18.0,
                fontFamily: FontFamily.light,
                textAlign: TextAlign.center,
              ),
              27.verticalSpace,
              PinCodeTextField(
                length: 6,
                appContext: context,
                obscureText: false,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.phone,
                cursorColor: AppColors.primary,
                controller: controller.otpController,
                textStyle: AppTextStyle(
                  fontSize: 20.0,
                  fontFamily: FontFamily.medium,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldWidth: 50,
                  fieldHeight: 50,

                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(12.0),
                  activeBoxShadow: [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 6.50,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                  inActiveBoxShadow: [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 6.50,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                  disabledColor: AppColors.white,
                  activeFillColor: AppColors.white,
                  activeColor: AppColors.white,
                  inactiveColor: AppColors.white,
                  inactiveFillColor: AppColors.white,
                  selectedFillColor: AppColors.white,
                  selectedColor: AppColors.white,
                ),
                enableActiveFill: true,

              ),
              45.verticalSpace,
              CommonButton(
                text: AppStrings.verify,
                onTap: () {

                  if (controller.otpController.text.isEmpty) {
                    CommonDialogue.alertActionDialogApp(
                        message: AppStrings.otpEmail);
                  } else if (int.parse(controller.otpController.text) < 6) {
                    CommonDialogue.alertActionDialogApp(
                        message: AppStrings.otpValidation);
                  } else {
                    controller.verifyOTPApi();
                  }
                },
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
