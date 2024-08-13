import 'package:tbd_flutter/app/modules/orderHistory/controllers/order_history_controller.dart';
import '../../../data/all.dart';

class OrderHistoryView extends GetView<OrderHistoryController> {
  const OrderHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.orderHistory,
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
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppColors.iconBG,
                                  ),
                                  child: SvgPicture.asset(
                                      AppIcons.iconsDelivered,
                                    color: AppColors.primary,
                                    height: 40.0,
                                  ),
                                ),
                                16.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                          AppStrings.delivered,
                                        fontSize: 15.0,
                                        fontFamily: FontFamily.medium,
                                      ),
                                      AppText(
                                          AppStrings.orderId + " : BA1224",
                                        fontSize: 12.0,
                                        fontFamily: FontFamily.medium,
                                        color: AppColors.discountedPriceColor,
                                      ),
                                    ],
                                  ),
                                ),
                                CommonWidget.circularIconWidget(
                                  radius: 15.0,
                                  icon: AppIcons.iconsDownArrow,
                                ),
                                10.horizontalSpace,
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              15.verticalSpace,
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
                              10.verticalSpace,
                              Column(
                                children: [
                                  for(int i = 0 ; i < 2 ; i++)
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0),
                                            color: AppColors.iconBG
                                          ),
                                          child: Image.asset("name"),
                                        )
                                      ],
                                    )
                                ],
                              ),
                              10.verticalSpace,
                            ],
                          ),
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
}
