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
            20.verticalSpace,
            CommonButton(
              text: "    " + AppStrings.yourVendorCode + " 16547",
              textSize: 15.0,
              alignment: Alignment.topLeft,
            ),
            30.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                decoration: CommonWidget.commonShadowWidget(),
                child: Column(
                  children: [
                    17.verticalSpace,
                    CommonWidget.circularIconWidget(
                      icon: AppIcons.iconsProductManager,
                      radius: 40.0,
                    ),
                    14.verticalSpace,
                    AppText(
                      AppStrings.productManagement,
                      fontSize: 20.0,
                      fontFamily: FontFamily.medium,
                    ),
                    14.verticalSpace,
                    CommonWidget.circularIconWidget(
                      radius: 18.0,
                      icon: AppIcons.iconsRightArrow,
                    ),
                    17.verticalSpace,
                  ],
                ),
              ),
            ),
            40.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                decoration: CommonWidget.commonShadowWidget(),
                child: Column(
                  children: [
                    17.verticalSpace,
                    CommonWidget.circularIconWidget(
                      icon: AppIcons.iconsOrderManagement,
                      radius: 40.0,
                    ),
                    14.verticalSpace,
                    AppText(
                      AppStrings.orderManagement,
                      fontSize: 20.0,
                      fontFamily: FontFamily.medium,
                    ),
                    14.verticalSpace,
                    CommonWidget.circularIconWidget(
                      radius: 18.0,
                      icon: AppIcons.iconsRightArrow,
                      // radius: 40.0,
                    ),
                    17.verticalSpace,
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
