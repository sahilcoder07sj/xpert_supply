import 'package:tbd_flutter/app/modules/login/controllers/login_controller.dart';
import '../../../data/all.dart';

class ResetPasswordView extends GetView<LoginController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      isAppbar: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                CommonWidget.roundIconWidget(imageName: AppIcons.iconsResetPasswordBig),
                13.verticalSpace,
                AppText(
                  AppStrings.resetPassword,
                  fontSize: 26.0,
                  fontFamily: FontFamily.semiBold,
                ),
                5.verticalSpace,
                AppText(
                  AppStrings.yourNewPasswordMustBeDifferent,
                  fontSize: 18.0,
                  fontFamily: FontFamily.light,
                  textAlign: TextAlign.center,
                ),
                27.verticalSpace,
                Obx(() => CommonTextFormField(
                  controller: controller.newPasswordController,
                  hintText: AppStrings.newPassword,
                  prefixIcon: AppIcons.iconsPassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.isNewPasswordHide.value,
                  suffixIcon: GestureDetector(
                    onTap: () => controller.isNewPasswordHide.value = !controller.isNewPasswordHide.value,
                    child: Transform.scale(
                      scale: 0.6,
                      child: Obx(() => SvgPicture.asset(controller.isNewPasswordHide.value ? AppIcons.iconsEyeOpen : AppIcons.iconsEyeSplash)),
                    ),
                  ),
                )),
                15.verticalSpace,
                Obx(() => CommonTextFormField(
                  controller: controller.confirmPasswordController,
                  hintText: AppStrings.confirmNewPassword,
                  prefixIcon: AppIcons.iconsPassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.isConfirmPasswordHide.value,
                  suffixIcon: GestureDetector(
                    onTap: () => controller.isConfirmPasswordHide.value = !controller.isConfirmPasswordHide.value,
                    child: Transform.scale(
                      scale: 0.6,
                      child: Obx(() => SvgPicture.asset(controller.isConfirmPasswordHide.value ? AppIcons.iconsEyeOpen : AppIcons.iconsEyeSplash)),
                    ),
                  ),
                )),
                35.verticalSpace,
                CommonButton(
                  text: AppStrings.update,
                  onTap: () => Get.offAllNamed(Routes.LOGIN),
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
