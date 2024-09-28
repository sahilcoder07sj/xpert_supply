import 'package:tbd_flutter/app/CommonWidget/custom_image_view.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/data/dynamic_height_grid.dart';
import 'package:tbd_flutter/app/modules/addProduct/widget/add_product_sheet.dart';
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
            title: controller.categoriesName,
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
            body: !controller.noDatFound.isEmpty
                ? Center(child: SvgPicture.asset(AppIcons.emptyProduct))
                : DynamicHeightGrid(
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.productsList.length,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    builder: (context, index) {
                      ProductsData data = controller.productsList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.PRODUCT_DETAIL, arguments: data);
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: CustomImageView(
                                      imagePath: data.imageUrl ?? "",
                                      height: 100,
                                      width: 100,
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
                                      AppText(
                                        "\$" + data.amount.toString(),
                                        fontFamily: FontFamily.semiBold,
                                        fontSize: 14,
                                        color: AppColors.priceColor,
                                      ),
                                      SizedBox(width: 4),
                                      data.discount != null
                                          ? AppText(
                                              "\$" + data.discount.toString(),
                                              fontFamily: FontFamily.medium,
                                              fontSize: 10,
                                              textDecoration:
                                                  TextDecoration.lineThrough,
                                              color: AppColors
                                                  .discountedPriceColor,
                                            )
                                          : SizedBox(),
                                    ],
                                  )
                                ],
                              ),
                              if (Constants.selectUser == Constants.vendor)
                                Positioned(
                                  right: 0.0,
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                    ),
                                    child: PopupMenuButton<dynamic>(
                                      itemBuilder: (BuildContext context) {
                                        return [
                                          PopupMenuItem(
                                            height: 30.0,
                                            padding: EdgeInsets.symmetric(
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
                                                      const EdgeInsets.only(
                                                          top: 3.0),
                                                  child: AppText(
                                                    AppStrings.archive,
                                                    fontSize: 14.0,
                                                    fontFamily:
                                                        FontFamily.medium,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ];
                                      },
                                      onSelected: (dynamic value) {
                                        // Handle the selected option
                                        print('Selected: $value');
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
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
                                        child: SvgPicture.asset(AppIcons.popup),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      );
                    },
                  ));
      },
    );
  }
}
