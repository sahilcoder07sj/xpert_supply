import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/data/dynamic_height_grid.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      assignId: true,
      init: ProductController(),
      builder: (controller) {
        return CommonScreen(
            title: "Raj",
            actions: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ADD_PRODUCT);
                },
                child: CommonWidget.circularIconWidget(
                  icon: AppIcons.iconsPlus,
                  radius: 14,
                  backgroundColor: AppColors.primary,
                ),
              ),
              SizedBox(width: 10)
            ],
            body: controller.noDatFound.isEmpty
                ? Center(child: SvgPicture.asset(AppIcons.emptyProduct))
                : DynamicHeightGrid(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.productList.length,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    builder: (context, index) {
                      var data = controller.productList[index];
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.iconBG,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                data["image"],
                                height: 100,
                                width: 100,
                              ),
                            ),
                            SizedBox(height: 10),
                            AppText(
                              data["name"],
                              fontFamily: FontFamily.medium,
                              fontSize: 12,
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                AppText(
                                  data["discounted_price"],
                                  fontFamily: FontFamily.semiBold,
                                  fontSize: 14,
                                  color: AppColors.priceColor,
                                ),
                                SizedBox(width: 4),
                                AppText(
                                  data["price"],
                                  fontFamily: FontFamily.medium,
                                  fontSize: 10,
                                  textDecoration: TextDecoration.lineThrough,
                                  color: AppColors.discountedPriceColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ));
      },
    );
  }
}
