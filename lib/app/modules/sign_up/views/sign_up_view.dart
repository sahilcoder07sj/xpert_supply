import 'package:tbd_flutter/app/CommonWidget/dialogue.dart';
import 'package:tbd_flutter/app/data/constants.dart';
import 'package:tbd_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:tbd_flutter/app/modules/sign_up/controllers/sign_up_controller.dart';
import '../../../data/all.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
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
                CommonWidget.roundIconWidget(imageName: AppIcons.iconsCreateNewAccountBig),
                13.verticalSpace,
                AppText(
                  AppStrings.createNewAccount,
                  fontSize: 26.0,
                  fontFamily: FontFamily.semiBold,
                ),
                5.verticalSpace,
                AppText(
                  AppStrings.enterYourDetailsBelow,
                  fontSize: 18.0,
                  fontFamily: FontFamily.light,
                ),
                27.verticalSpace,
                if(Constants.vendor == Constants.selectUser)...[
                  CommonTextFormField(
                    controller: controller.businessNameController,
                    hintText: AppStrings.businessName,
                    prefixIcon: AppIcons.iconsBusiness,
                  ),
                  15.verticalSpace,
                ],
                CommonTextFormField(
                  controller: controller.nameController,
                  hintText: AppStrings.name,
                  prefixIcon: AppIcons.iconsPerson,
                ),
                15.verticalSpace,
                CommonTextFormField(
                  controller: controller.emailController,
                  hintText: AppStrings.email,
                  prefixIcon: AppIcons.iconsEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                15.verticalSpace,
                Obx(() => CommonTextFormField(
                  controller: controller.passwordController,
                  hintText: AppStrings.password,
                  prefixIcon: AppIcons.iconsPassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.isPasswordHide.value,
                  suffixIcon: GestureDetector(
                    onTap: () => controller.isPasswordHide.value = !controller.isPasswordHide.value,
                    child: Transform.scale(
                      scale: 0.6,
                      child: Obx(() => SvgPicture.asset(controller.isPasswordHide.value ? AppIcons.iconsEyeOpen : AppIcons.iconsEyeSplash)),
                    ),
                  ),
                )),
                15.verticalSpace,
                Obx(() => CommonTextFormField(
                  controller: controller.confirmPasswordController,
                  hintText: AppStrings.confirmNewPassword,
                  prefixIcon: AppIcons.iconsPassword,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: controller.isConfirmPasswordHide.value,
                  suffixIcon: GestureDetector(
                    onTap: () => controller.isConfirmPasswordHide.value = !controller.isConfirmPasswordHide.value,
                    child: Transform.scale(
                      scale: 0.6,
                      child: Obx(() => SvgPicture.asset(controller.isConfirmPasswordHide.value ? AppIcons.iconsEyeOpen : AppIcons.iconsEyeSplash)),
                    ),
                  ),
                )),
                18.verticalSpace,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.isAgreePrivacyPolicy.value = !controller.isAgreePrivacyPolicy.value,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: Obx(() => Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SvgPicture.asset(
                            AppIcons.iconsTick,
                            color: !controller.isAgreePrivacyPolicy.value ? AppColors.transparent : null,
                          ),
                        )),
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: AppRichText(
                        firstText: AppStrings.iAgreeTo + " ",
                        secondText: AppStrings.privacyPolicy,
                        thirdText: " " + AppStrings.and+ " ",
                        forthText: AppStrings.termsCondition,
                      ),
                    )
                  ],
                ),
                20.verticalSpace,
                CommonButton(
                  text: AppStrings.signUp,
                  onTap: () {
                    if(controller.validation()){
                      controller.sendOtpApi();
                    }
                  },
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppRichText(
              firstText: AppStrings.alreadyHAveAnAccount + " ",
              secondText: AppStrings.signIn,
              onTap: () => Get.back(),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.0),
          ],
        ),
      ),
    );
  }
}
