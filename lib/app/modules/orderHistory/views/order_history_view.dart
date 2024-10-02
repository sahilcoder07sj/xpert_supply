import 'package:tbd_flutter/app/CommonWidget/common_botttom_sheet.dart';
import 'package:tbd_flutter/app/CommonWidget/custom_image_view.dart';
import 'package:tbd_flutter/app/modules/orderHistory/controllers/order_history_controller.dart';
import 'package:tbd_flutter/app/modules/orderHistory/model/order_history_model.dart';
import '../../../data/all.dart';

class OrderHistoryView extends GetView<OrderHistoryController> {
  const OrderHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(
      assignId: true,
      init: OrderHistoryController(),
      builder: (controller) {
        return CommonScreen(
          title: AppStrings.orderHistory,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: controller.noData.isEmpty
                ? Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                itemCount: controller.orderHistoryData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  OrderHistoryData data =
                  controller.orderHistoryData[index];
                  return GestureDetector(
                    onTap: () => controller.selectIndex.value = index,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: CommonWidget.commonShadowWidget(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                      CommonBottomSheet(
                                        subTitle:
                                        "Your order will be delivered tomorrow as you have placed it after 8:00 PM",
                                        image: AppIcons
                                            .iconsOrderDeliveredBig,
                                        isOneButton: true,
                                        singleButtonText:
                                        AppStrings.ok,
                                        commonOnTap: () => Get.back(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      color: AppColors.iconBG,
                                    ),
                                    child: SvgPicture.asset(
                                      AppIcons.iconsDelivered,
                                      color: AppColors.primary,
                                      height: 40.0,
                                    ),
                                  ),
                                ),
                                16.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        data.status!.capitalize ?? "",
                                        fontSize: 15.0,
                                        fontFamily: FontFamily.medium,
                                      ),
                                      AppText(
                                        AppStrings.orderId +
                                            " : ${data.uniqueOrderId ?? "BA1224"}",
                                        fontSize: 12.0,
                                        fontFamily: FontFamily.medium,
                                        color: AppColors
                                            .discountedPriceColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(() =>
                                    CommonWidget.circularIconWidget(
                                      radius: 15.0,
                                      icon: controller.selectIndex
                                          .value ==
                                          index
                                          ? AppIcons.iconsUpArrow
                                          : AppIcons.iconsDownArrow,
                                    )),
                                10.horizontalSpace,
                              ],
                            ),
                          ),
                          Obx(() => controller.selectIndex.value ==
                              index
                              ? Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              15.verticalSpace,
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                      EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius
                                            .circular(5.0),
                                        color: AppColors.iconBG,
                                      ),
                                      child: SvgPicture.asset(
                                          AppIcons
                                              .iconsLocation),
                                    ),
                                    6.horizontalSpace,
                                    Expanded(
                                      child: AppText(
                                        "${data.deliveryAddress!.address ?? ""}, ${data.deliveryAddress!.area ?? ""}, ${data.deliveryAddress!.city ?? ""}, ${data.deliveryAddress!.country ?? ""}, ${data.deliveryAddress!.pincode ?? ""}",
                                        fontSize: 12.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                              data.deliveryDate != null
                                  ? Padding(
                                padding: const EdgeInsets
                                    .symmetric(
                                    horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                      EdgeInsets.all(
                                          5.0),
                                      decoration:
                                      BoxDecoration(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            5.0),
                                        color: AppColors
                                            .iconBG,
                                      ),
                                      child: SvgPicture
                                          .asset(AppIcons
                                          .iconsDeliveryDate),
                                    ),
                                    6.horizontalSpace,
                                    AppText(
                                      "Delivery Date : ${data.deliveryDate!.split(" ").first}",
                                      fontSize: 12.0,
                                    )
                                  ],
                                ),
                              )
                                  : SizedBox(),
                              10.verticalSpace,
                              buildDivider(),
                              10.verticalSpace,
                              data.notes != null
                                  ? Padding(
                                padding: const EdgeInsets
                                    .symmetric(
                                    horizontal: 8.0),
                                child: Row(
                                  children: [
                                    AppText(
                                      AppStrings.note +
                                          " : ",
                                      fontSize: 15.0,
                                      fontFamily:
                                      FontFamily
                                          .medium,
                                    ),
                                    Expanded(
                                      child: AppText(
                                        data.notes ?? "",
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  : SizedBox(),
                              10.verticalSpace,
                              buildDivider(),
                              Column(
                                children: [
                                  for (int i = 0;
                                  i < data.products!.length;
                                  i++)
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets
                                              .only(
                                              right: 8.0,
                                              left: 8.0,
                                              top: 10.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding:
                                                EdgeInsets
                                                    .all(
                                                    5.0),
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5.0),
                                                    color: AppColors
                                                        .iconBG),
                                                child:
                                                CustomImageView(
                                                  imagePath: data
                                                      .products![
                                                  i]
                                                      .imageUrl ??
                                                      "",
                                                ),
                                              ),
                                              10.horizontalSpace,
                                              Expanded(
                                                child: AppText(
                                                  data.products![i]
                                                      .name ??
                                                      "",
                                                  fontSize:
                                                  14.0,
                                                  fontFamily:
                                                  FontFamily
                                                      .medium,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  AppText(
                                                    AppStrings
                                                        .quantity,
                                                    fontSize:
                                                    10.0,
                                                  ),
                                                  2.verticalSpace,
                                                  AppText(
                                                    "${data.products![i].quantity}",
                                                    fontSize:
                                                    15.0,
                                                    fontFamily:
                                                    FontFamily
                                                        .medium,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // 10.verticalSpace,
                                        if (i != 1) ...[
                                          10.verticalSpace,
                                          buildDivider()
                                        ]
                                      ],
                                    )
                                ],
                              ),
                              // 10.verticalSpace,
                            ],
                          )
                              : SizedBox()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
                : Center(
              child: SvgPicture.asset(AppIcons.emptyProduct),
            ),
          ),
        );
      },
    );
  }

  Container buildDivider() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: AppColors.divider,
    );
  }
}
