import 'package:tbd_flutter/app/data/all.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
                CommonWidget.roundIconWidget(imageName: AppIcons.iconsPasswordBig),
                13.verticalSpace,
                AppText(
                    AppStrings.signInToYourAccount,
                  fontSize: 24,
                  fontFamily: FontFamily.semiBold,
                  textAlign: TextAlign.center,
                ),
                5.verticalSpace,
                AppText(
                  AppStrings.pleaseSignInToContinue,
                  fontSize: 18.0,
                  fontFamily: FontFamily.light,
                ),
                27.verticalSpace,
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
                  textInputAction: TextInputAction.done,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                    child: AppText(
                        AppStrings.forgotPassword,
                    ),
                  ),
                ),
                38.verticalSpace,
                CommonButton(
                  text: AppStrings.signIn,
                  onTap: () {
                    if(Constants.vendor == Constants.selectUser){
                      // Get.offAllNamed(Routes.MANAGEMENT);
                      Get.offAllNamed(Routes.DELIVERY);
                    } else{
                      Get.offAllNamed(Routes.CONSUMER_PRODUCTS);
                    }
                  },
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppRichText(
            firstText: AppStrings.dontHaveAnAccount + " ",
            secondText: AppStrings.signUp,
            onTap: () => Get.toNamed(Routes.SIGN_UP),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10.0),
        ],
      ),
    );
  }
}
