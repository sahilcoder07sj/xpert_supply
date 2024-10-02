import 'package:tbd_flutter/app/CommonWidget/custom_image_view.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/data/dynamic_height_grid.dart';
import 'package:tbd_flutter/app/modules/addProduct/widget/add_product_sheet.dart';
import 'package:tbd_flutter/app/modules/product/model/get_product_model.dart';
import 'package:tbd_flutter/app/modules/vendor_categories_list/model/product_list_model.dart';
import 'package:tbd_flutter/app/modules/vendor_list/model/product_list_model.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      assignId: true,
      init: ProductController(),
      builder: (controller) {
        return CommonScreen(
          title: Constants.selectUser == Constants.consumer
              ? controller.getCategoryData?.name
              : controller.getCategoryData?.name ?? "",
          body: Obx(() =>  controller.noData.isNotEmpty
              ? Center(child: SvgPicture.asset(AppIcons.emptyProduct))
              : SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                DynamicHeightGrid(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      horizontal: 15, vertical: 5.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.getProductList.length,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  builder: (context, index) {
                    Products data = controller.getProductList[index];
                    return GestureDetector(
                      onTap: () {
                        controller.selectIndex = index;
                        Get.toNamed(Routes.PRODUCT_DETAIL,
                            arguments: {
                              "details": data,
                              "category_details":
                              controller.getCategoryData
                            })?.then((value) {
                          if (value != null && value == "delete") {
                            controller.getProductList
                                .removeAt(controller.selectIndex);
                          } else {
                            // if(Constants.selectUser == Constants.vendor){}
                            controller.getProduct(isReset: true);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.iconBG,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: CustomImageView(
                                    imagePath: data.imageUrl ?? "",
                                    height: 140.0,
                                    width: 120.0,
                                  ),
                                ),
                                SizedBox(height: 10),
                                AppText(
                                  data.name ?? "",
                                  fontFamily: FontFamily.medium,
                                  fontSize: 12,
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    if (data.discount != null &&
                                        data.discount != 0) ...[
                                      AppText(
                                        "\$${data.discount ?? 0}",
                                        fontFamily:
                                        FontFamily.semiBold,
                                        fontSize: 14,
                                        color: AppColors.priceColor,
                                      ),
                                      SizedBox(width: 4),
                                    ],
                                    AppText(
                                      "\$${data.amount ?? 0}",
                                      fontFamily: FontFamily.medium,
                                      fontSize: 10,
                                      textDecoration:
                                      TextDecoration.lineThrough,
                                      color: AppColors
                                          .discountedPriceColor,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            if (Constants.selectUser ==
                                Constants.vendor)
                              Positioned(
                                right: 0.0,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    highlightColor:
                                    Colors.transparent,
                                    splashColor: Colors.transparent,
                                  ),
                                  child: PopupMenuButton<dynamic>(
                                    itemBuilder:
                                        (BuildContext context) {
                                      return [
                                        PopupMenuItem(
                                          value: "1",
                                          height: 30.0,
                                          padding:
                                          EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 25.0,
                                                width: 25.0,
                                                child: Image.asset(
                                                    AppIcons.archive),
                                              ),
                                              5.horizontalSpace,
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 3.0),
                                                child: AppText(
                                                  AppStrings.archive,
                                                  fontSize: 14.0,
                                                  fontFamily:
                                                  FontFamily
                                                      .medium,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ];
                                    },
                                    onSelected: (dynamic value) {
                                      controller.addArchive(
                                          productId:
                                          data.productId ?? 0,
                                          index: index);
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(
                                          Radius.circular(16.0),
                                        )),
                                    color: AppColors.white,
                                    child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.iconBG,
                                              width: 1.5),
                                          color: AppColors.white,
                                          shape: BoxShape.circle),
                                      child: SvgPicture.asset(
                                          AppIcons.popup),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Obx(() => controller.isPaginationLoading.value
                    ? Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 1.0,
                  ),
                )
                    : SizedBox())
              ],
            ),
          )
          ),
          actions: [
            if (Constants.selectUser == Constants.vendor)
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(AddProductSheet());
                },
                child: CommonWidget.circularIconWidget(
                  icon: AppIcons.iconsPlus,
                  radius: 15,
                  backgroundColor: AppColors.primary,
                ),
              ),
            SizedBox(width: 10)
          ],
        );
      },
    );
  }
}
