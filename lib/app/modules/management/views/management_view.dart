import 'package:tbd_flutter/app/data/responsive.dart';

import '../../../data/all.dart';
import '../controllers/management_controller.dart';

class ManagementView extends GetView<ManagementController> {
  const ManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      isLeading: false,
      title: AppStrings.management,
      actions: [
        CommonWidget.circularIconWidget(icon: AppIcons.iconsNotification),
        10.horizontalSpace,
        CommonWidget.circularIconWidget(icon: AppIcons.iconsUser),
        15.horizontalSpace,
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: responsiveHeight(15)),
            CommonButton(
              text: "    " + AppStrings.yourVendorCode + " 16547",
              textSize: 15.0,
              alignment: Alignment.centerLeft,
            ),

            SizedBox(height: responsiveHeight(20)),
            SizedBox(
              width: double.infinity,
              height: 180,
              child: DecoratedBox(
                decoration: CommonWidget.commonShadowWidget(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonWidget.circularIconWidget(
                      icon: AppIcons.iconsProductManager,
                      radius: responsiveHeight(45),
                    ),

                    AppText(
                      AppStrings.productManagement,
                      fontSize: 18,
                      fontFamily: FontFamily.medium,
                    ),
                    CommonWidget.circularIconWidget(
                      radius: responsiveHeight(18.0),
                      icon: AppIcons.iconsRightArrow,
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(20)),
            SizedBox(
              height: 180,
              width: double.infinity,
              child: DecoratedBox(
                decoration: CommonWidget.commonShadowWidget(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonWidget.circularIconWidget(
                      icon: AppIcons.iconsOrderManagement,
                      radius: responsiveHeight(45),
                    ),

                    AppText(
                      AppStrings.orderManagement,
                      fontSize: 20.0,
                      fontFamily: FontFamily.medium,
                    ),

                    CommonWidget.circularIconWidget(
                      radius: responsiveHeight(18),
                      icon: AppIcons.iconsRightArrow,
                      // radius: 40.0,
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonButton(
              text: AppStrings.quoteRequest,
              bgColor: AppColors.white,
              onTap: () {
                Get.toNamed(Routes.DELIVERY);
              },
              fontColor: AppColors.primary,
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.0),
          ],
        ),
      ),
    );
  }
}
