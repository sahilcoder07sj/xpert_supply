import 'package:tbd_flutter/app/modules/login/controllers/login_controller.dart';
import '../../../data/all.dart';

class ForgotPassword extends GetView<LoginController> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      assignId: true,
      init: LoginController(),
      builder: (controller) {
        return CommonScreen(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery
                      .of(context)
                      .padding
                      .top + 60.0),
                  CommonWidget.roundIconWidget(
                      imageName: AppIcons.iconsPasswordBig),
                  13.verticalSpace,
                  AppText(
                    AppStrings.forgotPassword,
                    fontSize: 26.0,
                    fontFamily: FontFamily.semiBold,
                  ),
                  5.verticalSpace,
                  AppText(
                    AppStrings.noWorriesWeWillHelpYou,
                    fontSize: 18.0,
                    fontFamily: FontFamily.light,
                    textAlign: TextAlign.center,
                  ),
                  27.verticalSpace,
                  CommonTextFormField(
                    controller: controller.forgotEmailController,
                    hintText: AppStrings.email,
                    prefixIcon: AppIcons.iconsEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                  45.verticalSpace,
                  CommonButton(
                    text: AppStrings.send,
                    onTap: () {
                      if (controller.validation(isForgotValidation: true)) {
                        controller.forgotPasswordApi();
                      }
                    },
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
