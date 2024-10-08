import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/CommonWidget/camera_bottom_sheet.dart';
import 'package:tbd_flutter/app/CommonWidget/custom_image_view.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:text_marquee/text_marquee.dart';
import 'package:text_scroll/text_scroll.dart';

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
      body: Obx(() => controller.singleProductDetails.value != null
          ? ListView(
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
                      imagePath: controller
                              .singleProductDetails.value?.data?.imageUrl ??
                          "",
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*TextScroll(
                                    controller.singleProductDetails.value?.data?.name ?? "",
                                  mode: TextScrollMode.bouncing,
                                  style: AppTextStyle(
                                    fontFamily: FontFamily.medium,
                                    fontSize: 22,
                                  ),
                                ),*/
                                AppText(
                                    controller.singleProductDetails.value?.data?.name ?? "",
                                  fontFamily: FontFamily.medium,
                                  fontSize: 22,
                                  maxLines: 2,
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: [
                                    if (controller.singleProductDetails.value
                                                ?.data?.discount !=
                                            null &&
                                        controller.singleProductDetails.value
                                                ?.data?.discount !=
                                            0) ...[
                                      AppText(
                                        "\$${controller.singleProductDetails.value?.data?.discount ?? 0}",
                                        fontFamily: FontFamily.semiBold,
                                        fontSize: 18,
                                        color: AppColors.priceColor,
                                      ),
                                      SizedBox(width: 4),
                                    ],
                                    AppText(
                                      "\$${controller.singleProductDetails.value?.data?.amount ?? 0}",
                                      fontFamily: FontFamily.medium,
                                      fontSize: controller.singleProductDetails.value?.data?.discount != null ? 14 : 18,
                                      textDecoration: controller.singleProductDetails.value?.data?.discount != null ? TextDecoration.lineThrough : TextDecoration.none,
                                      color: controller.singleProductDetails.value?.data?.discount != null ? AppColors.discountedPriceColor : AppColors.priceColor,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          if (Constants.selectUser == Constants.vendor)...[
                            5.horizontalSpace,
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.EDIT_PRODUCT, arguments: {
                                  "details":
                                      controller.singleProductDetails.value
                                })?.then((value) {
                                  if (value != null) {
                                    controller.getProduct();
                                  }
                                });
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
                                    subTitle: AppStrings
                                        .areYouSureYouWantToDeleteThisProduct,
                                    image: AppIcons.iconsDeleteBig,
                                    iconBgColor: AppColors.red.withOpacity(0.1),
                                    firstOnTap: () => Get.back(),
                                    secondOnTap: () =>
                                        controller.deleteProduct(),
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
                        controller.singleProductDetails.value?.data
                                ?.description ??
                            "",
                        fontSize: 14.0,
                      ),
                    ],
                  ),
                )
              ],
            )
          : SizedBox()),
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
                          onTap: (){
                            controller.addToCartApi(isOrderNow: true);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 10.0),
                ],
              ),
            )
          : null,
    );
  }
}
