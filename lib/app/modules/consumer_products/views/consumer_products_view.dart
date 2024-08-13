import 'package:tbd_flutter/app/modules/consumer_products/controllers/consumer_products_controller.dart';
import '../../../data/all.dart';

class ConsumerProductsView extends GetView<ConsumerProductsController> {
  const ConsumerProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      isLeading: false,
      title: AppStrings.products,
      actions: [
        GestureDetector(
          onTap: () => Get.toNamed(Routes.MY_CART),
          child: CommonWidget.circularIconWidget(
            icon: AppIcons.iconsCart,
            radius: 18.0,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.MY_PROFILE),
          child: CommonWidget.circularIconWidget(
            icon: AppIcons.iconsUser,
            radius: 18.0,
          ),
        ),
        SizedBox(width: 10),
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            children: [
              10.verticalSpace,
              SvgPicture.asset(AppIcons.productVendor),
              CommonTextFormField(
                controller: controller.vendorCodeController,
                hintText: AppStrings.enterVendorCode,
                contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                border: customOutlineInputBorder(
                  borderColor: AppColors.border.withOpacity(0.1),
                ),
                fillColor: AppColors.iconBG,
                isShadow: false,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonButton(text: AppStrings.apply),
            SizedBox(height: MediaQuery.of(context).padding.bottom+10.0),
          ],
        ),
      ),
    );
  }
}
