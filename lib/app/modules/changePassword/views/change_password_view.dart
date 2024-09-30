import '../../../data/all.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      assignId: true,
      init: ChangePasswordController(),
      builder: (controller) {
        return CommonScreen(
          title: AppStrings.changePassword,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                20.verticalSpace,
                Obx(() => CommonTextFormField(
                      controller: controller.currentPasswordController,
                      hintText: AppStrings.currentPassword,
                      prefixIcon: AppIcons.iconsPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isCurrentHide.value,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.isCurrentHide.value =
                            !controller.isCurrentHide.value,
                        child: Transform.scale(
                          scale: 0.6,
                          child: Obx(() => SvgPicture.asset(
                              controller.isCurrentHide.value
                                  ? AppIcons.iconsEyeOpen
                                  : AppIcons.iconsEyeSplash)),
                        ),
                      ),
                    )),
                15.verticalSpace,
                Obx(() => CommonTextFormField(
                      controller: controller.newPasswordController,
                      hintText: AppStrings.newPassword,
                      prefixIcon: AppIcons.iconsPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isNewHide.value,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.isNewHide.value =
                            !controller.isNewHide.value,
                        child: Transform.scale(
                          scale: 0.6,
                          child: Obx(() => SvgPicture.asset(
                              controller.isNewHide.value
                                  ? AppIcons.iconsEyeOpen
                                  : AppIcons.iconsEyeSplash)),
                        ),
                      ),
                    )),
                15.verticalSpace,
                Obx(() => CommonTextFormField(
                      controller: controller.confirmNewController,
                      hintText: AppStrings.confirmNewPassword,
                      prefixIcon: AppIcons.iconsPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isNewConfirmHide.value,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.isNewConfirmHide.value =
                            !controller.isNewConfirmHide.value,
                        child: Transform.scale(
                          scale: 0.6,
                          child: Obx(() => SvgPicture.asset(
                              controller.isNewConfirmHide.value
                                  ? AppIcons.iconsEyeOpen
                                  : AppIcons.iconsEyeSplash)),
                        ),
                      ),
                    )),
                35.verticalSpace,
                CommonButton(
                  text: AppStrings.update,
                  onTap: () {
                    if (controller.changePasswordValidation()) {
                      controller.changePasswordApi();
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
