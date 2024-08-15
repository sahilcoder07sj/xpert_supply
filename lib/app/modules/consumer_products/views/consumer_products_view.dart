import 'package:tbd_flutter/app/modules/consumer_products/controllers/consumer_products_controller.dart';
import 'package:tbd_flutter/app/modules/myProfile/controllers/my_profile_controller.dart';
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
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.toNamed(Routes.PRODUCT),
              child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: CommonWidget.commonShadowWidget(radius: 15.0,),
              child: Row(
                children: [
                  Expanded(
                    child: AppText(
                      "Fruit",
                      fontSize: 15.0,
                      color: AppColors.primary,
                    ),
                  ),
                  SvgPicture.asset(AppIcons.iconsRightArrow)
                ],
              ),
                        ),
            );
          },
        ),
      ),
      /// bottom button
      /*bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonButton(text: AppStrings.apply),
            SizedBox(height: MediaQuery.of(context).padding.bottom+10.0),
          ],
        ),
      ),*/
    );
  }
}

/// enter vendor code
/*
Center(
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
        )
 */
