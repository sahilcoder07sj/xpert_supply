import 'package:tbd_flutter/app/modules/myCart/controllers/my_cart_controller.dart';
import '../../../data/all.dart';

class MyCartView extends GetView<MyCartController> {
  const MyCartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.myCart,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        itemCount: 3,
          itemBuilder: (context, index) => Container(
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
          ],
        ),
      ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonButton(
                text: AppStrings.placeOrder,
              onTap: () => Get.toNamed(Routes.MY_ORDER),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom+10.0),
          ],
        ),
      ),
    );
  }
}

