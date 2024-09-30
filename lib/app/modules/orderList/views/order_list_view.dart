import 'package:intl/intl.dart';
import 'package:tbd_flutter/app/CommonWidget/common_botttom_sheet.dart';
import 'package:tbd_flutter/app/modules/orderList/controllers/order_list_controller.dart';
import 'package:tbd_flutter/app/modules/orderList/model/get_orders_model.dart';
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
              String temp = "";
              if(value == 1){
                temp = AppStrings.fastDelivery;
              } else if(value == 2){
                temp = AppStrings.normalDelivery;
              } else if(value == 0){
                temp = AppStrings.bothDelivery;
              }
              controller.selectFilter.value = temp;
              controller.getOrdersAPI(isReset: true);
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
      body: GetBuilder<OrderListController>(
        init: OrderListController(),
        builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(() => controller.errorMessage.value.isEmpty ? ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          itemCount: controller.orderList.length,
          itemBuilder: (context, index) {
            Orders data = controller.orderList[index];
            DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(data.deliveryDate ?? "");
            String formattedDate = DateFormat("dd/MM/yyyy").format(dateTime);
            return GestureDetector(
              onTap: () {
                if(controller.orderList[index].isCheck.value){
                  controller.orderList[index].isCheck.value = false;
                } else{
                  controller.orderList.forEach((element) {
                    element.isCheck.value = false;
                  });
                  controller.orderList[index].isCheck.value = true;
                }
              },
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
                                  data.customerName ?? "",
                                  fontSize: 16.0,
                                  fontFamily: FontFamily.medium,
                                ),
                                AppText(
                                  "\$${double.parse(data.totalAmount.toString()).toStringAsFixed(0)}",
                                  fontFamily: FontFamily.semiBold,
                                  fontSize: 14,
                                  color: AppColors.priceColor,
                                ),
                              ],
                            ),
                          ),
                          Obx(() => CommonWidget.circularIconWidget(
                            radius: 15.0,
                            icon: data.isCheck.value ? AppIcons.iconsUpArrow : AppIcons.iconsDownArrow,
                          )),
                          10.horizontalSpace,
                        ],
                      ),
                    ),
                    Obx(() => data.isCheck.value ? Column(
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
                                value: data.status,
                                icon: SvgPicture.asset(AppIcons.iconsDownArrow),
                                dropdownColor: AppColors.white,
                                underline: SizedBox(),
                                borderRadius: BorderRadius.circular(10.0),
                                onChanged: (String? newValue) {
                                  data.status = newValue ?? "";
                                  controller.updateOrderStatus(orderId: data.orderId ?? 0, status: data.status);
                                },
                                items: <String>['pending', 'processing', "completed"]
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
                                AppStrings.orderId+" : ${data.orderId}",
                                fontSize: 12.0,
                              )
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Expanded(
                                child: AppText(
                                  "${data.deliveryAddress?.address}, ${data.deliveryAddress?.area}, ${data.deliveryAddress?.city}, ${data.deliveryAddress?.country} - ${data.deliveryAddress?.pincode}",
                                  fontSize: 12.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        if(data.deliveryDate != null)...[
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
                                  "Delivery Date : $formattedDate",
                                  fontSize: 12.0,
                                )
                              ],
                            ),
                          ),
                          10.verticalSpace,
                        ],
                        buildDivider(),
                        10.verticalSpace,
                        if(data.notes != null)...[
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
                                    data.notes ?? "",
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          10.verticalSpace,
                        ],
                        buildDivider(),
                        Column(
                          children: [
                            for(int i = 0 ; i < data.products!.length ; i++)
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
                                          child: CommonNetworkImage(
                                            imageUrl: data.products?[i].imageUrl ?? "",
                                            height: 50.0,
                                            width: 50.0,
                                          ),
                                        ),
                                        10.horizontalSpace,
                                        Expanded(
                                          child: AppText(
                                            data.products?[i].name ?? "",
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
                                              "${data.products?[i].quantity ?? 0}",
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
          },)
            : Center(child: SvgPicture.asset(AppIcons.emptyProduct))),
      )),
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
        value: text == AppStrings.fastDelivery ? 1 : text == AppStrings.normalDelivery ? 2 : 0,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        height: isDivider ? 40.0 : 30.0,
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text,
                    fontSize: 14.0,
                    fontFamily: FontFamily.medium,
                  ),
                  if(controller.selectFilter.value == text)...[
                    3.horizontalSpace,
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.done_rounded,
                        size: 12.0,
                      ),
                    ),
                  ]
                ],
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
