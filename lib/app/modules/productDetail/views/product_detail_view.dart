import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/CommonWidget/camera_bottom_sheet.dart';
import 'package:tbd_flutter/app/data/all.dart';

import '../../../CommonWidget/common_botttom_sheet.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.productDetails,
      extendBodyBehindAppBar: true,
      appBarBackgroundColor: Colors.transparent,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 300,
            padding: EdgeInsets.only(top: AppBar().preferredSize.height),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.iconBG,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(130),
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/aadu.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.verticalSpace,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Arabic Ginger",
                          fontFamily: FontFamily.medium,
                          fontSize: 24,
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            AppText(
                              "\$25",
                              fontFamily: FontFamily.semiBold,
                              fontSize: 18,
                              color: AppColors.priceColor,
                            ),
                            SizedBox(width: 4),
                            AppText(
                              "\$446",
                              fontFamily: FontFamily.medium,
                              fontSize: 14,
                              textDecoration: TextDecoration.lineThrough,
                              color: AppColors.discountedPriceColor,
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    if(Constants.selectUser == Constants.vendor)...[
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.EDIT_PRODUCT);

                        },
                        child: Container(
                          height: responsiveHeight(40),
                          width: responsiveWidth(40),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: SvgPicture.asset(
                                AppIcons.iconsEditDeliveryAddress,
                                color: AppColors.primary,
                              )),
                        ),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            CommonBottomSheet(
                              firstButtonText: AppStrings.cancel,
                              secondButtonText: AppStrings.delete,
                              subTitle:
                              AppStrings.areYouSureYouWantToDeleteThisProduct,
                              image: AppIcons.iconsDeleteBig,
                              iconBgColor: AppColors.red.withOpacity(0.1),
                            ),
                          );
                        },
                        child: Container(
                          height: responsiveHeight(40),
                          width: responsiveWidth(40),
                          decoration: BoxDecoration(
                            color: AppColors.red.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: SvgPicture.asset(
                                AppIcons.iconsDelete,
                                color: AppColors.red,
                              )),
                        ),
                      ),
                    ],
                  ],
                ),
                20.verticalSpace,
                AppText(
                    "Ginger is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.",
                  fontSize: 14.0,
                ),
                10.verticalSpace,
                AppText(
                  "Apples are one of the healthiest fruits. Rich in vitamin C and dietary fiber which keep our digestive and immune system healthy. Protects from Alzheimers, type 2 diabetes and cancer. It is a natural teeth whitener and prevent bad breath.s.",
                  fontSize: 14.0,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Constants.selectUser == Constants.consumer ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                      text: AppStrings.addToCart,
                    onTap: () => Get.toNamed(Routes.MY_CART),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: CommonButton(
                      text: AppStrings.orderNow,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.0),
          ],
        ),
      ) : null,
    );
  }
}
