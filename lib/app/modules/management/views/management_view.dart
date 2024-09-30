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
        CommonWidget.circularIconWidget(
            icon: AppIcons.iconsNotification,
          onTap: () => Get.toNamed(Routes.NOTIFICATION),
        ),
        10.horizontalSpace,
        GestureDetector(
          onTap: () => Get.toNamed(Routes.MY_PROFILE),
          child: CommonWidget.circularIconWidget(icon: AppIcons.iconsUser),
        ),
        15.horizontalSpace,
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: responsiveHeight(15)),
            Obx(() => CommonButton(
              text: "    " + AppStrings.yourVendorCode + " ${controller.vendorModel.value?.vendorNo ?? ""}",
              textSize: 15.0,
              alignment: Alignment.centerLeft,
            )),
            SizedBox(height: responsiveHeight(20)),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.CATEGORY),
              child: SizedBox(
                width: double.infinity,
                height: responsiveHeight(190),
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
            ),
            SizedBox(height: responsiveHeight(20)),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.ORDER_LIST),
              child: SizedBox(
                height: responsiveHeight(190),
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
                        fontSize: 18,
                        fontFamily: FontFamily.medium,
                      ),
                      CommonWidget.circularIconWidget(
                        radius: responsiveHeight(18),
                        icon: AppIcons.iconsRightArrow,
                      ),
                    ],
                  ),
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
                Get.toNamed(Routes.QUATE);
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
