import 'package:tbd_flutter/app/CommonWidget/app_text.dart';
import 'package:tbd_flutter/app/data/app_strings.dart';
import 'package:tbd_flutter/app/data/constants.dart';
import 'package:tbd_flutter/app/data/extenstion.dart';
import 'package:tbd_flutter/app/routes/app_pages.dart';
import '../../../data/all.dart';
import '../controllers/select_user_controller.dart';

class SelectUserView extends GetView<SelectUserController> {
  const SelectUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Constants.selectUser = Constants.vendor;
                Get.toNamed(Routes.LOGIN);
              },
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  shadows: [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 20.40,
                      offset: Offset(0, 7),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    17.verticalSpace,
                    CircleAvatar(
                      radius: 40.0,
                      backgroundColor: AppColors.iconBG,
                      child: SvgPicture.asset(AppIcons.iconsVendor),
                    ),
                    14.verticalSpace,
                    AppText(
                        AppStrings.vendor,
                      fontFamily: FontFamily.medium,
                      fontSize: 20.0,
                    ),
                    14.verticalSpace,
                    CircleAvatar(
                      backgroundColor: AppColors.iconBG,
                      child: SvgPicture.asset(AppIcons.iconsRightArrow),
                    ),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            GestureDetector(
              onTap: () {
                Constants.selectUser = Constants.consumer;
                Get.toNamed(Routes.LOGIN);
              },
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  shadows: [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 20.40,
                      offset: Offset(0, 7),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    17.verticalSpace,
                    CircleAvatar(
                      radius: 40.0,
                      backgroundColor: AppColors.iconBG,
                      child: SvgPicture.asset(AppIcons.iconsConsumer),
                    ),
                    14.verticalSpace,
                    AppText(
                        AppStrings.consumer,
                      fontFamily: FontFamily.medium,
                      fontSize: 20.0,
                    ),
                    14.verticalSpace,
                    CircleAvatar(
                      backgroundColor: AppColors.iconBG,
                      child: SvgPicture.asset(AppIcons.iconsRightArrow),
                    ),
                    16.verticalSpace,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
