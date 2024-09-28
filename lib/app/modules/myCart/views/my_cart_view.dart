import 'package:tbd_flutter/app/CommonWidget/custom_image_view.dart';
import 'package:tbd_flutter/app/modules/myCart/controllers/my_cart_controller.dart';
import 'package:tbd_flutter/app/modules/vendor_list/model/product_list_model.dart';
import '../../../data/all.dart';

class MyCartView extends GetView<MyCartController> {
  const MyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartController>(
      assignId: true,
      init: MyCartController(),
      builder: (controller) {
        return CommonScreen(
          title: AppStrings.myCart,
          body: controller.noData.isNotEmpty
              ? Center(
                  child: SvgPicture.asset(
                    AppIcons.emptyProduct,
                  ),
                )
              : ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  itemCount: controller.cartList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ProductsData data = controller.cartList[index];
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
                                                  fontFamily: FontFamily.medium,
                                                  fontSize: 12,
                                                  textDecoration: TextDecoration
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
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: AppColors.border.withOpacity(0.1),
                                    border: Border.all(
                                        color:
                                            AppColors.border.withOpacity(0.2)),
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
          bottomNavigationBar: controller.cartList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonButton(
                        text: AppStrings.placeOrder,
                        onTap: () => Get.toNamed(Routes.MY_ORDER),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 10.0),
                    ],
                  ),
                )
              : SizedBox(),
        );
      },
    );
  }
}
