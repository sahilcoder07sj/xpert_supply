import 'package:tbd_flutter/app/CommonWidget/common_botttom_sheet.dart';
import 'package:tbd_flutter/app/modules/orderList/controllers/order_list_controller.dart';
import '../../../data/all.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.orderList,
      actions: [
        Theme(
          data: Theme.of(context).copyWith(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: PopupMenuButton<dynamic>(
            itemBuilder: (BuildContext context) {
              return [
                buildPopupMenuItem(text: AppStrings.fastDelivery),
                buildPopupMenuItem(text: AppStrings.normalDelivery),
                buildPopupMenuItem(text: AppStrings.bothDelivery, isDivider: false),
              ];
            },
            position: PopupMenuPosition.under,
            onSelected: (dynamic value) {
              print('Selected: $value');
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                )),
            color: AppColors.white,
            child: CommonWidget.circularIconWidget(icon: AppIcons.popup),
          ),
        ),
        10.horizontalSpace,
      ],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            10.verticalSpace,
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.selectIndex.value = index,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: CommonWidget.commonShadowWidget(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                10.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        "Meet Kakadiya",
                                        fontSize: 16.0,
                                        fontFamily: FontFamily.medium,
                                      ),
                                      AppText(
                                        "\$25",
                                        fontFamily: FontFamily.semiBold,
                                        fontSize: 14,
                                        color: AppColors.priceColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(() => CommonWidget.circularIconWidget(
                                  radius: 15.0,
                                  icon: controller.selectIndex.value == index ? AppIcons.iconsUpArrow : AppIcons.iconsDownArrow,
                                )),
                                10.horizontalSpace,
                              ],
                            ),
                          ),
                          Obx(() => controller.selectIndex.value == index ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              15.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: AppColors.primary,
                                      ),
                                      child: Transform.scale(
                                        scale: 1.1,
                                          child: SvgPicture.asset(AppIcons.iconsDelivered),
                                      ),
                                    ),
                                    6.horizontalSpace,
                                    DropdownButton<String>(
                                      value: controller.dropdownValue.value,
                                      icon: SvgPicture.asset(AppIcons.iconsDownArrow),
                                      dropdownColor: AppColors.white,
                                      underline: SizedBox(),
                                      borderRadius: BorderRadius.circular(10.0),
                                      onChanged: (String? newValue) {
                                        controller.dropdownValue.value = newValue ?? "";
                                      },
                                      items: <String>['Pending', 'Shipped', 'Delivered']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: AppText(
                                            value,
                                            fontSize: 12.0,
                                            fontFamily: FontFamily.medium,
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: AppColors.iconBG,
                                      ),
                                      child: Transform.scale(
                                        scale: 1.1,
                                          child: SvgPicture.asset(AppIcons.iconsOrderId),
                                      ),
                                    ),
                                    6.horizontalSpace,
                                    AppText(
                                      AppStrings.orderId+" : BA1255",
                                      fontSize: 12.0,
                                    )
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: AppColors.iconBG,
                                      ),
                                      child: SvgPicture.asset(AppIcons.iconsLocation),
                                    ),
                                    6.horizontalSpace,
                                    AppText(
                                      "10 Furnival Street, EC4A 1AB London, UK",
                                      fontSize: 12.0,
                                    )
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: AppColors.iconBG,
                                      ),
                                      child: SvgPicture.asset(AppIcons.iconsDeliveryDate),
                                    ),
                                    6.horizontalSpace,
                                    AppText(
                                      "Delivery Date : 04/03/2024",
                                      fontSize: 12.0,
                                    )
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                              buildDivider(),
                              10.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    AppText(
                                      AppStrings.note + " : ",
                                      fontSize: 15.0,
                                      fontFamily: FontFamily.medium,
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
                              10.verticalSpace,
                              buildDivider(),
                              Column(
                                children: [
                                  for(int i = 0 ; i < 2 ; i++)
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 10.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5.0),
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    color: AppColors.iconBG
                                                ),
                                                child: Image.asset("assets/images/papaiyu.png"),
                                              ),
                                              10.horizontalSpace,
                                              Expanded(
                                                child: AppText(
                                                  "Banana",
                                                  fontSize: 14.0,
                                                  fontFamily: FontFamily.medium,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  AppText(
                                                    AppStrings.quantity,
                                                    fontSize: 10.0,
                                                  ),
                                                  2.verticalSpace,
                                                  AppText(
                                                    "01",
                                                    fontSize: 15.0,
                                                    fontFamily: FontFamily.medium,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // 10.verticalSpace,
                                        if(i != 1)...[
                                          10.verticalSpace,
                                          buildDivider()
                                        ]
                                      ],
                                    )
                                ],
                              ),
                              // 10.verticalSpace,
                            ],
                          ) : SizedBox()),
                        ],
                      ),
                    ),
                  );
                },),
            )
          ],

        ),
      ),
    );
  }

  Container buildDivider() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: AppColors.divider,
    );
  }

  PopupMenuItem<dynamic> buildPopupMenuItem({required String text, bool isDivider = true}) {
    return PopupMenuItem(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        height: isDivider ? 40.0 : 30.0,
        child: Center(
          child: Column(
            children: [
              AppText(
                text,
                fontSize: 14.0,
                fontFamily: FontFamily.medium,
              ),
              if(isDivider)Container(
                margin: EdgeInsets.only(top: 6.0),
                height: 1,
                width: double.infinity,
                color: AppColors.iconBG,
              ),
            ],
          ),
        ),
      );
  }
}
