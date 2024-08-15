import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/data/all.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: "Product Details",
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
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
                    GestureDetector(
                      onTap: () {},
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
                      onTap: () {},
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
                ),
                SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
