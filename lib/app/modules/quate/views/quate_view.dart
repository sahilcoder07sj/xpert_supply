import 'package:tbd_flutter/app/modules/quate/model/get_quote_model.dart';
import 'package:tbd_flutter/app/modules/quate/model/quote_list_model.dart';
import '../../../data/all.dart';
import '../controllers/quate_controller.dart';

class QuateView extends GetView<QuateController> {
  const QuateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: Constants.selectUser == Constants.vendor
          ? AppStrings.quoteList
          : AppStrings.quate,
      body: Constants.selectUser == Constants.vendor
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Obx(() => controller.errorMessage.isEmpty
                  ? Column(
                      children: [
                        10.verticalSpace,
                        Expanded(
                          child: ListView.builder(
                            controller: controller.scrollController,
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            itemCount: controller.quoteList.length,
                            itemBuilder: (context, index) {
                              GetQuoteData data = controller.quoteList[index];
                              return GestureDetector(
                                onTap: () {
                                  if (data.isCheck?.value == true) {
                                    data.isCheck?.value = false;
                                  } else {
                                    controller.quoteList.forEach((element) {
                                      element.isCheck?.value = false;
                                    });
                                    data.isCheck?.value = true;
                                  }
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      decoration:
                                          CommonWidget.commonShadowWidget(),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AppText(
                                                        data.customer?.name ??
                                                            "",
                                                        fontSize: 15.0,
                                                        fontFamily:
                                                            FontFamily.medium,
                                                      ),
                                                      AppText(
                                                        "\$${double.parse(data.totalPrice ?? "").toStringAsFixed(0)}",
                                                        fontFamily:
                                                            FontFamily.semiBold,
                                                        fontSize: 12,
                                                        color: AppColors
                                                            .priceColor,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Obx(() => CommonWidget
                                                        .circularIconWidget(
                                                      radius: 15.0,
                                                      icon: data.isCheck
                                                                  ?.value ==
                                                              true
                                                          ? AppIcons
                                                              .iconsUpArrow
                                                          : AppIcons
                                                              .iconsDownArrow,
                                                    )),
                                                5.horizontalSpace,
                                              ],
                                            ),
                                          ),
                                          Obx(() => data.isCheck?.value == true
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    15.verticalSpace,
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 15.0),
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
                                                                    .iconsLocation),
                                                          ),
                                                          6.horizontalSpace,
                                                          AppText(
                                                            "${data.customer?.address}, ${data.customer?.city}, ${data.customer?.country}",
                                                            fontSize: 12.0,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    /*if (data.customer?.phoneNumber !=
                                                        null) ...[
                                                      10.verticalSpace,
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    15.0),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
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
                                                                      .iconsPhone),
                                                            ),
                                                            6.horizontalSpace,
                                                            AppText(
                                                              data.customer
                                                                      ?.phoneNumber ??
                                                                  "",
                                                              fontSize: 12.0,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],*/
                                                    10.verticalSpace,
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 15.0),
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
                                                                    .emailSmall),
                                                          ),
                                                          6.horizontalSpace,
                                                          AppText(
                                                            data.customer
                                                                    ?.email ??
                                                                "",
                                                            fontSize: 12.0,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    if (Constants.selectUser ==
                                                        Constants.consumer) ...[
                                                      15.verticalSpace,
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    15.0),
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                AppText(
                                                                  AppStrings
                                                                      .totalPrice,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                                5.verticalSpace,
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  width: 80.0,
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              5.0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    color: AppColors
                                                                        .border
                                                                        .withOpacity(
                                                                            0.1),
                                                                    border: Border.all(
                                                                        color: AppColors
                                                                            .border
                                                                            .withOpacity(0.2)),
                                                                  ),
                                                                  child:
                                                                      AppText(
                                                                    "\$1000",
                                                                    fontFamily:
                                                                        FontFamily
                                                                            .medium,
                                                                    fontSize:
                                                                        15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            SvgPicture.asset(
                                                                AppIcons
                                                                    .nextPrice),
                                                            Spacer(),
                                                            Column(
                                                              children: [
                                                                AppText(
                                                                  AppStrings
                                                                      .offerPrice,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                                5.verticalSpace,
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  width: 80.0,
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              5.0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    color: AppColors
                                                                        .border
                                                                        .withOpacity(
                                                                            0.1),
                                                                    border: Border.all(
                                                                        color: AppColors
                                                                            .border
                                                                            .withOpacity(0.2)),
                                                                  ),
                                                                  child:
                                                                      AppText(
                                                                    "\$700",
                                                                    fontFamily:
                                                                        FontFamily
                                                                            .medium,
                                                                    fontSize:
                                                                        15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      10.verticalSpace,
                                                      buildDivider(),
                                                      10.verticalSpace,
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    15.0),
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
                                                                "Lorem Ipsum is simply dummy text",
                                                                fontSize: 13.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                    10.verticalSpace,
                                                    buildDivider(),
                                                    Column(
                                                      children: [
                                                        for (int i = 0;
                                                            i <
                                                                data.products!
                                                                    .length;
                                                            i++)
                                                          Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            15.0,
                                                                        left:
                                                                            15.0,
                                                                        top:
                                                                            10.0),
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5.0),
                                                                      height:
                                                                          50.0,
                                                                      width:
                                                                          50.0,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              5.0),
                                                                          color:
                                                                              AppColors.iconBG),
                                                                      child:
                                                                          CommonNetworkImage(
                                                                        imageUrl:
                                                                            data.products?[i].imageUrl ?? "",
                                                                        height:
                                                                            50.0,
                                                                        width:
                                                                            50.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    10.horizontalSpace,
                                                                    Expanded(
                                                                      child:
                                                                          AppText(
                                                                        data.products?[i].name ??
                                                                            "",
                                                                        fontSize:
                                                                            14.0,
                                                                        fontFamily:
                                                                            FontFamily.medium,
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
                                                                          "${data.products?[i].quantity ?? 0}",
                                                                          fontSize:
                                                                              15.0,
                                                                          fontFamily:
                                                                              FontFamily.medium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              // 10.verticalSpace,
                                                              if (i != 0) ...[
                                                                10.verticalSpace,
                                                                buildDivider()
                                                              ]
                                                            ],
                                                          )
                                                      ],
                                                    ),
                                                    if (Constants.vendor ==
                                                            Constants
                                                                .selectUser &&
                                                        data.status ==
                                                            "pending") ...[
                                                      10.verticalSpace,
                                                      buildDivider(),
                                                      20.verticalSpace,
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    15.0),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  CommonButton(
                                                                text: AppStrings
                                                                    .rejectQuate,
                                                                bgColor:
                                                                    AppColors
                                                                        .white,
                                                                fontColor:
                                                                    AppColors
                                                                        .primary,
                                                                onTap: () => controller.manageQuote(
                                                                    isSend:
                                                                        false,
                                                                    quoteId: data
                                                                        .quoteId,
                                                                    index:
                                                                        index),
                                                              ),
                                                            ),
                                                            15.horizontalSpace,
                                                            Expanded(
                                                              child:
                                                                  CommonButton(
                                                                text: AppStrings
                                                                    .sendOffer,
                                                                bgColor:
                                                                    AppColors
                                                                        .white,
                                                                fontColor:
                                                                    AppColors
                                                                        .primary,
                                                                onTap: () => controller
                                                                    .sendOfferDialogue(
                                                                  index: index,
                                                                        quoteId:
                                                                            data.quoteId ??
                                                                                0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                    if(Constants.vendor ==
                                                        Constants
                                                            .selectUser &&
                                                        data.status !=
                                                            "pending")Column(
                                                      children: [
                                                        10.verticalSpace,
                                                        buildDivider(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 20.0,
                                                                  right: 20.0,
                                                                  top: 15.0),
                                                          child: AppText(
                                                            data.status
                                                                    ?.capitalizeFirst ??
                                                                "",
                                                            color: data.status ==
                                                                    "canceled"
                                                                ? AppColors.red
                                                                : Colors.green,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              : SizedBox()),
                                        ],
                                      ),
                                    ),
                                    Obx(() => controller
                                                .isPaginationLoading.value &&
                                            controller.quoteList.length - 1 ==
                                                index
                                        ? CircularProgressIndicator(
                                            strokeWidth: 1.0,
                                            color: AppColors.primary)
                                        : SizedBox())
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  : Center(child: SvgPicture.asset(AppIcons.emptyProduct))),
            )
          : Obx(() => controller.errorMessage.isEmpty ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: controller.quoteHistoryData.length,
                  itemBuilder: (context, index) {
                    QuoteHistoryData data = controller.quoteHistoryData[index];
                    return GestureDetector(
                      onTap: () {
                        if (data.isCheck?.value == true) {
                          data.isCheck?.value = false;
                        } else {
                          controller.quoteList.forEach((element) {
                            element.isCheck?.value = false;
                          });
                          data.isCheck?.value = true;
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            decoration: CommonWidget.commonShadowWidget(),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              data.vendor!.name ?? "",
                                              fontSize: 15.0,
                                              fontFamily: FontFamily.medium,
                                            ),
                                            AppText(
                                              "\$${double.parse(data.totalPrice ?? "").toStringAsFixed(0)}",
                                              fontFamily: FontFamily.semiBold,
                                              fontSize: 12,
                                              color: AppColors.priceColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Obx(() => CommonWidget.circularIconWidget(
                                            radius: 15.0,
                                            icon: data.isCheck?.value == true
                                                ? AppIcons.iconsUpArrow
                                                : AppIcons.iconsDownArrow,
                                          )),
                                      5.horizontalSpace,
                                    ],
                                  ),
                                ),
                                Obx(() => data.isCheck?.value == true
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          15.verticalSpace,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: AppColors.iconBG,
                                                  ),
                                                  child: SvgPicture.asset(
                                                      AppIcons.iconsLocation),
                                                ),
                                                6.horizontalSpace,
                                                data.address != null ?  Expanded(
                                                  child: AppText(
                                                    "${data.address?.address ?? ""}, ${data.address?.area ?? ""}, ${data.address?.city ?? ""}, ${data.address?.country ?? ""}, ${data.address?.pincode ?? ""}",
                                                    fontSize: 14.0,
                                                  ),
                                                ):SizedBox(),
                                              ],
                                            ),
                                          ),
                                          10.verticalSpace,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: AppColors.iconBG,
                                                  ),
                                                  child: SvgPicture.asset(
                                                      AppIcons.emailSmall),
                                                ),
                                                6.horizontalSpace,
                                                AppText(
                                                  data.vendor!.email ?? "",
                                                  fontSize: 12.0,
                                                )
                                              ],
                                            ),
                                          ),
                                          15.verticalSpace,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    AppText(
                                                      AppStrings.totalPrice,
                                                      fontSize: 12.0,
                                                    ),
                                                    5.verticalSpace,
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 80.0,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color: AppColors.border
                                                            .withOpacity(0.1),
                                                        border: Border.all(
                                                            color: AppColors
                                                                .border
                                                                .withOpacity(
                                                                    0.2)),
                                                      ),
                                                      child: AppText(
                                                        "\$${data.totalPrice ?? 0.0}",
                                                        fontFamily:
                                                            FontFamily.medium,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                SvgPicture.asset(
                                                    AppIcons.nextPrice),
                                                Spacer(),
                                                Column(
                                                  children: [
                                                    AppText(
                                                      AppStrings.offerPrice,
                                                      fontSize: 12.0,
                                                    ),
                                                    5.verticalSpace,
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 80.0,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color: AppColors.border
                                                            .withOpacity(0.1),
                                                        border: Border.all(
                                                            color: AppColors
                                                                .border
                                                                .withOpacity(
                                                                    0.2)),
                                                      ),
                                                      child: AppText(
                                                        "\$${data.offerPrice ?? 0.0}",
                                                        fontFamily:
                                                            FontFamily.medium,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          data.message != null && data.message != ""
                                              ? Column(
                                                  children: [
                                                    10.verticalSpace,
                                                    buildDivider(),
                                                    10.verticalSpace,
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 15.0),
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
                                                              data.message ??
                                                                  "",
                                                              fontSize: 13.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
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
                                                          const EdgeInsets.only(
                                                              right: 15.0,
                                                              left: 15.0,
                                                              top: 10.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            height: 50.0,
                                                            width: 50.0,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: AppColors
                                                                    .iconBG),
                                                            child:
                                                                CommonNetworkImage(
                                                              imageUrl: data
                                                                      .products?[
                                                                          i]
                                                                      .imageUrl ??
                                                                  "",
                                                              height: 50.0,
                                                              width: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          10.horizontalSpace,
                                                          Expanded(
                                                            child: AppText(
                                                              data.products?[i]
                                                                      .name ??
                                                                  "",
                                                              fontSize: 14.0,
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
                                                                fontSize: 10.0,
                                                              ),
                                                              2.verticalSpace,
                                                              AppText(
                                                                "${data.products?[i].quantity ?? 0}",
                                                                fontSize: 15.0,
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
                                                    if (i != 0) ...[
                                                      10.verticalSpace,
                                                      buildDivider()
                                                    ]
                                                  ],
                                                )
                                            ],
                                          ),
                                          10.verticalSpace,
                                          buildDivider(),
                                          20.verticalSpace,
                                          data.status == "offered"
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: CommonButton(
                                                          text: "Reject Offer",
                                                          bgColor:
                                                              AppColors.white,
                                                          fontColor:
                                                              AppColors.primary,
                                                          onTap: () {
                                                            controller
                                                                .customerManageQuote(
                                                                    isAccepted:
                                                                        false,
                                                                    index:
                                                                        index,
                                                                    quoteId: data
                                                                        .quoteId
                                                                        .toString());
                                                          },
                                                        ),
                                                      ),
                                                      15.horizontalSpace,
                                                      Expanded(
                                                        child: CommonButton(
                                                          text: "Accept Offer",
                                                          bgColor:
                                                              AppColors.white,
                                                          fontColor:
                                                              AppColors.primary,
                                                          onTap: () {
                                                            controller
                                                                .customerManageQuote(
                                                                    isAccepted:
                                                                        true,
                                                                    index:
                                                                        index,
                                                                    quoteId: data
                                                                        .quoteId
                                                                        .toString());
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Align(
                                                  alignment: Alignment.center,
                                                  child: AppText(
                                                    data.status
                                                            ?.capitalizeFirst ??
                                                        "",
                                                    color: data.status ==
                                                            "canceled"
                                                        ? AppColors.red
                                                        : Colors.green,
                                                  ),
                                                ),
                                        ],
                                      )
                                    : SizedBox()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ) : Center(child: SvgPicture.asset(AppIcons.emptyProduct))),
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
