import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/CommonWidget/camera_bottom_sheet.dart';
import 'package:tbd_flutter/app/CommonWidget/custom_image_view.dart';
import 'package:tbd_flutter/app/data/all.dart';

import '../../../CommonWidget/common_botttom_sheet.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      assignId: true,
      init: ProductDetailController(),
      builder: (controller) {
        return CommonScreen(
          title: AppStrings.productDetails,
          extendBodyBehindAppBar: true,
          appBarBackgroundColor: Colors.transparent,
          body:controller.productsData != null ? ListView(
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
                  child: CustomImageView(
                    imagePath:controller.productsData!.imageUrl,
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
                            controller.productsData!.name ?? "",
                              fontFamily: FontFamily.medium,
                              fontSize: 24,
                            ),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                AppText(
                                  "\$${controller.productsData!.amount ?? ""}",
                                  fontFamily: FontFamily.semiBold,
                                  fontSize: 18,
                                  color: AppColors.priceColor,
                                ),
                                SizedBox(width: 4),
                                controller.productsData!.discount != null ?   AppText(
                                  "\$${controller.productsData!.discount ?? ""}",
                                  fontFamily: FontFamily.medium,
                                  fontSize: 14,
                                  textDecoration: TextDecoration.lineThrough,
                                  color: AppColors.discountedPriceColor,
                                ):SizedBox(),
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
                                  AppStrings
                                      .areYouSureYouWantToDeleteThisProduct,
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
                      controller.productsData!.description ?? "",
                      fontSize: 14.0,
                    ),
                  ],
                ),
              )
            ],
          ):SizedBox(),
          bottomNavigationBar: Constants.selectUser == Constants.consumer
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        text: AppStrings.addToCart,
                        onTap: () {
                          controller.addToCartApi();
                        },
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: CommonButton(
                        text: AppStrings.orderNow,
                        onTap: () => Get.toNamed(Routes.MY_ORDER),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .padding
                    .bottom + 10.0),
              ],
            ),
          )
              : null,
        );
      },
    );
  }
}
