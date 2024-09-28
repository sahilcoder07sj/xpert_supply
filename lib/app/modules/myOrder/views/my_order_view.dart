import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/CommonWidget/common_botttom_sheet.dart';
import 'package:tbd_flutter/app/CommonWidget/custom_image_view.dart';
import 'package:tbd_flutter/app/CommonWidget/screen.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/modules/addEditAddress/model/add_edit_address_model.dart';
import 'package:tbd_flutter/app/modules/vendor_list/model/product_list_model.dart';

import '../controllers/my_order_controller.dart';

class MyOrderView extends GetView<MyOrderController> {
  const MyOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrderController>(
      assignId: true,
      init: MyOrderController(),
      builder: (controller) {
        return CommonScreen(
          title: AppStrings.myOrder,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  ListView.builder(
                    itemCount: controller.cartProducts.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      ProductsData data = controller.cartProducts[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        decoration: CommonWidget.commonShadowWidget(),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
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
                                    child: CustomImageView(
                                      imagePath: data.image,
                                    ),
                                  ),
                                  10.horizontalSpace,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          data.name ?? "",
                                          maxLines: 1,
                                          fontSize: 17.0,
                                          fontFamily: FontFamily.medium,
                                        ),
                                        Row(
                                          children: [
                                            AppText(
                                              "\$${data.amount}",
                                              fontFamily: FontFamily.semiBold,
                                              fontSize: 15.0,
                                              color: AppColors.priceColor,
                                            ),
                                            SizedBox(width: 4),
                                            data.discount != null
                                                ? AppText(
                                              "\$${data.discount}",
                                              fontFamily:
                                              FontFamily.medium,
                                              fontSize: 12,
                                              textDecoration:
                                              TextDecoration
                                                  .lineThrough,
                                              color: AppColors
                                                  .discountedPriceColor,
                                            )
                                                : SizedBox(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  CommonWidget.circularIconWidget(
                                    icon: AppIcons.iconsQtyMinus,
                                    radius: 14.0,
                                    onTap: () {
                                      if (data.quantity! > 0) {
                                        controller.addMinusQuantity(
                                          isMinus: true,
                                          productId: "${data.productId}",
                                          productsData: data,
                                        );
                                      }
                                    },
                                  ),
                                  5.horizontalSpace,
                                  Container(
                                    alignment: Alignment.center,
                                    width: 40.0,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 4.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: AppColors.border.withOpacity(0.1),
                                      border: Border.all(
                                          color: AppColors.border
                                              .withOpacity(0.2)),
                                    ),
                                    child: AppText(
                                      data.quantity.toString(),
                                      color: AppColors.border,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  CommonWidget.circularIconWidget(
                                    icon: AppIcons.iconsQtyPlus,
                                    radius: 14.0,
                                    backgroundColor: AppColors.primary,
                                    onTap: () {
                                      controller.addMinusQuantity(
                                        isMinus: false,
                                        productId: "${data.productId}",
                                        productsData: data,
                                      );
                                    },
                                  ),
                                  5.horizontalSpace,
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
                        onTap: () {
                          Get.toNamed(Routes.ADD_EDIT_ADDRESS)!.then((value) {
                            if (value != null) {
                              controller.addressList.add(value);
                              controller.update();
                            }
                          });
                        },
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
                    padding:
                    EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: AppColors.white,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.addressList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        AddEditAddressData data = controller.addressList[index];
                        return Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.addressId = data.id;
                                      controller.update();
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      margin: EdgeInsets.only(bottom: 18),
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      child: controller.addressId == data.id
                                          ? Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primary,
                                          border: Border.all(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      )
                                          : SizedBox(),
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Expanded(
                                    child: AppText(
                                      "${data.address ?? ""}, ${data.area ??
                                          ""}, ${data.city ?? ""}, ${data
                                          .country ?? ""}, ${data.pincode ??
                                          ""}",
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.ADD_EDIT_ADDRESS,
                                              arguments: {
                                                "is_edit": true,
                                                "address_data": data,
                                              })!
                                              .then((value) {
                                            if (value != null) {
                                              data = value;
                                              controller.update();
                                            }
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          AppIcons.iconsEditDeliveryAddress,
                                        ),
                                      ),
                                      5.horizontalSpace,
                                      GestureDetector(
                                        onTap: () {
                                          Get.bottomSheet(
                                            CommonBottomSheet(
                                              title: AppStrings.deleteMyAccount,
                                              subTitle: AppStrings
                                                  .areYouSureYouWantToDeleteAddress,
                                              image: AppIcons.iconsDeleteBig,
                                              iconBgColor: AppColors.red
                                                  .withOpacity(0.1),
                                              firstOnTap: () {
                                                controller.deleteAddress(
                                                    addressId: data.id);
                                              },
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          AppIcons.iconsDelete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  5.horizontalSpace,
                                ],
                              ),
                            ),
                            index != 1
                                ? Container(
                              height: 1.0,
                              width: double.infinity,
                              color: AppColors.iconBG,
                            )
                                : SizedBox(),
                          ],
                        );
                      },
                    ),
                  ),
                  20.verticalSpace,
                  controller.deliveryData != null
                      ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    decoration: CommonWidget.commonShadowWidget(
                      radius: 12.0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    AppStrings.normalDelivery,
                                    fontSize: 17.0,
                                    fontFamily: FontFamily.medium,
                                  ),
                                  8.verticalSpace,
                                  AppRichText(
                                    firstText: AppStrings.days + ": ",
                                    secondText: controller
                                        .deliveryData!.normalDeliveryDays
                                        .toString(),
                                    fontSize: 14.0,
                                    firstTextFontFamily:
                                    FontFamily.regular,
                                    secondTextFontFamily:
                                    FontFamily.medium,
                                  )
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () =>
                                controller
                                    .isFastDelivery.value = false,
                                child: Obx(() =>
                                    Container(
                                      padding: EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: !controller
                                                .isFastDelivery.value
                                                ? AppColors.primary
                                                : AppColors.border),
                                      ),
                                      child: CircleAvatar(
                                        radius: 7.0,
                                        backgroundColor: !controller
                                            .isFastDelivery.value
                                            ? AppColors.primary
                                            : Colors.transparent,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    AppStrings.fastDelivery,
                                    fontSize: 17.0,
                                    fontFamily: FontFamily.medium,
                                  ),
                                  8.verticalSpace,
                                  AppRichText(
                                    firstText: AppStrings.days + ": ",
                                    secondText: controller
                                        .deliveryData!.fastDeliveryDays
                                        .toString(),
                                    fontSize: 14.0,
                                    firstTextFontFamily:
                                    FontFamily.regular,
                                    secondTextFontFamily:
                                    FontFamily.medium,
                                  ),
                                  8.verticalSpace,
                                  AppRichText(
                                    firstText: AppStrings.charges + ": ",
                                    secondText:
                                    "\$${controller.deliveryData!
                                        .fastDeliveryCharges}",
                                    fontSize: 14.0,
                                    firstTextFontFamily:
                                    FontFamily.regular,
                                    secondTextFontFamily:
                                    FontFamily.medium,
                                  )
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () =>
                                controller
                                    .isFastDelivery.value = true,
                                child: Obx(() =>
                                    Container(
                                      padding: EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: controller
                                                .isFastDelivery.value
                                                ? AppColors.primary
                                                : AppColors.border),
                                      ),
                                      child: CircleAvatar(
                                        radius: 7.0,
                                        backgroundColor: controller
                                            .isFastDelivery.value
                                            ? AppColors.primary
                                            : Colors.transparent,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                      : SizedBox(),
                  controller.deliveryData != null
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      AppText(
                        AppStrings.deliveryDate,
                        fontSize: 14.0,
                        fontFamily: FontFamily.medium,
                      ),
                      5.verticalSpace,
                      Obx(() {
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15.0),
                          decoration: CommonWidget.commonShadowWidget(
                            radius: 12.0
                          ),
                          child: AppText(
                            "${controller.isFastDelivery.value ? controller
                                .deliveryData!.fastDeliveryDate : controller
                                .deliveryData!.normalDeliveryDate}",
                            fontSize: 14.0,
                          ),
                        );
                      }),
                    ],
                  )
                      : SizedBox(),
                  10.verticalSpace,
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
                    onTap: () {
                      controller.placeOrder();
                    },
                  ),
                  SizedBox(
                      height: MediaQuery
                          .of(context)
                          .padding
                          .bottom + 10.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
