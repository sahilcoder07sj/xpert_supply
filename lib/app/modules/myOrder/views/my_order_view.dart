import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/CommonWidget/screen.dart';
import 'package:tbd_flutter/app/data/all.dart';

import '../controllers/my_order_controller.dart';

class MyOrderView extends GetView<MyOrderController> {
  const MyOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.myOrder,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: AppColors.white,
                ),
                child: Column(
                  children: [
                    for(int i = 0 ; i < 2 ; i++)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 70.0,
                                  width: 70.0,
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppColors.iconBG,
                                  ),
                                  child: Image.asset(
                                    "assets/images/aadu.png",
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          "Arabic Ginger",
                                          fontSize: 17.0,
                                          fontFamily: FontFamily.medium,
                                        ),
                                        Row(
                                          children: [
                                            AppText(
                                              "\$25",
                                              fontFamily: FontFamily.semiBold,
                                              fontSize: 15.0,
                                              color: AppColors.priceColor,
                                            ),
                                            SizedBox(width: 4),
                                            AppText(
                                              "\$446",
                                              fontFamily: FontFamily.medium,
                                              fontSize: 12,
                                              textDecoration: TextDecoration.lineThrough,
                                              color: AppColors.discountedPriceColor,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                5.horizontalSpace,
                                CommonWidget.circularIconWidget(
                                  icon: AppIcons.iconsQtyMinus,
                                  radius: 14.0,
                                  onTap: () {
                                    if(controller.tempQty.value > 0){
                                      controller.tempQty.value--;
                                    }
                                  },
                                ),
                                5.horizontalSpace,
                                Container(
                                  alignment: Alignment.center,
                                  width: 40.0,
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: AppColors.border.withOpacity(0.1),
                                    border: Border.all(color: AppColors.border.withOpacity(0.2)),
                                  ),
                                  child: Obx(() => AppText(
                                    controller.tempQty.value.toString(),
                                    color: AppColors.border,
                                    fontSize: 12.0,
                                  )),
                                ),
                                5.horizontalSpace,
                                CommonWidget.circularIconWidget(
                                  icon: AppIcons.iconsQtyPlus,
                                  radius: 14.0,
                                  backgroundColor: AppColors.primary,
                                  onTap: () => controller.tempQty.value++,
                                ),
                                5.horizontalSpace,
                              ],
                            ),
                          ),
                          i != 1 ? Container(
                            height: 1.0,
                            width: double.infinity,
                            color: AppColors.iconBG,
                          ) : SizedBox(),
                        ],
                      )
                  ],
                ),
              ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: AppText(
                        AppStrings.deliveryAddress,
                      fontSize: 14.0,
                      fontFamily: FontFamily.medium,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.ADD_EDIT_ADDRESS),
                    child: AppText(
                      AppStrings.addAddress,
                      fontSize: 12.0,
                     color: AppColors.border,
                      fontFamily: FontFamily.medium,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              5.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: AppColors.white,
                ),
                child: Obx(() => Stack(
                  children: [
                    controller.isOpenAllAddress.value ? Column(
                      children: [
                        for(int i = 0 ; i < 2 ; i++)
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: AppText(
                                        "10 Furnival Street, EC4A 1AB London, UK sdfeu 2qsfuq 2 fd  df  wgdwdf   d ",
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    GestureDetector(
                                      onTap: () => Get.toNamed(Routes.ADD_EDIT_ADDRESS, arguments: {"is_edit" : true}),
                                      child: SvgPicture.asset(AppIcons.iconsEditDeliveryAddress),
                                    ),
                                    5.horizontalSpace,
                                  ],
                                ),
                              ),
                              i != 1 ? Container(
                                height: 1.0,
                                width: double.infinity,
                                color: AppColors.iconBG,
                              ) : SizedBox(),
                            ],
                          )
                      ],
                    ) : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppText(
                              "10 Furnival Street, EC4A 1AB London, UK sdfeu 2qsfuq 2 fd  df  wgdwdf   d ",
                              fontSize: 14.0,
                            ),
                          ),
                          10.horizontalSpace,
                        ],
                      ),
                    ),
                    Positioned(
                      top: 5.0,
                      right: 5.0,
                      child: GestureDetector(
                        onTap: () => controller.isOpenAllAddress.value = !controller.isOpenAllAddress.value,
                        child: Transform.scale(
                            scale: 1.5,
                            child: SvgPicture.asset(controller.isOpenAllAddress.value ? AppIcons.iconsUpArrow : AppIcons.iconsDownArrow)),
                      ),
                    )
                  ],
                )),
              ),
              20.verticalSpace,
              AppText(
                AppStrings.deliveryDate,
                fontSize: 14.0,
                fontFamily: FontFamily.medium,
              ),
              5.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.0),
                decoration: CommonWidget.commonShadowWidget(
                  radius: 12.0,
                ),
                child: AppText(
                  "04/03/2024",
                  fontSize: 14.0,
                ),
              ),
              20.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.0),
                decoration: CommonWidget.commonShadowWidget(
                  radius: 12.0,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                  AppStrings.normalDelivery,
                                fontSize: 17.0,
                                fontFamily: FontFamily.medium,
                              ),
                              8.verticalSpace,
                              AppRichText(
                                firstText: AppStrings.days+": ",
                                secondText: "15",
                                fontSize: 14.0,
                                firstTextFontFamily: FontFamily.regular,
                                secondTextFontFamily: FontFamily.medium,
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => controller.isFastDelivery.value = true,
                            child: Obx(() => Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: controller.isFastDelivery.value ? AppColors.primary : AppColors.border
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 7.0,
                                backgroundColor: controller.isFastDelivery.value ? AppColors.primary : Colors.transparent,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    8.verticalSpace,
                    Container(
                      height: 1.0,
                      width: double.infinity,
                      color: AppColors.iconBG,
                    ),
                    8.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                AppStrings.fastDelivery,
                                fontSize: 17.0,
                                fontFamily: FontFamily.medium,
                              ),
                              8.verticalSpace,
                              AppRichText(
                                firstText: AppStrings.days+": ",
                                secondText: "5",
                                fontSize: 14.0,
                                firstTextFontFamily: FontFamily.regular,
                                secondTextFontFamily: FontFamily.medium,
                              ),
                              8.verticalSpace,
                              AppRichText(
                                firstText: AppStrings.charges+": ",
                                secondText: "\$550",
                                fontSize: 14.0,
                                firstTextFontFamily: FontFamily.regular,
                                secondTextFontFamily: FontFamily.medium,
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => controller.isFastDelivery.value = false,
                            child: Obx(() => Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: !controller.isFastDelivery.value ? AppColors.primary : AppColors.border
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 7.0,
                                backgroundColor: !controller.isFastDelivery.value ? AppColors.primary : Colors.transparent,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              AppText(
                AppStrings.note,
                fontSize: 14.0,
                fontFamily: FontFamily.medium,
              ),
              5.verticalSpace,
              CommonTextFormField(
                contentPadding: EdgeInsets.all(15.0),
                controller: controller.noteController,
                maxLines: 5,
                hintText: "Lorem Ipsum is simply dummy text",
              ),
              20.verticalSpace,
              CommonButton(
                  text: AppStrings.getQuote,
                borderColor: AppColors.primary,
                bgColor: AppColors.white,
                fontColor: AppColors.primary,
              ),
              15.verticalSpace,
              CommonButton(
                  text: AppStrings.placeOrder,
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom+10.0),
            ],
          ),
        ),
      ),
    );
  }
}

