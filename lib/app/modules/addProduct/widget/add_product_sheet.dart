import 'package:tbd_flutter/app/modules/product/controllers/product_controller.dart';

import '../../../data/all.dart';

class AddProductSheet extends GetView<ProductController> {
  const AddProductSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              AppText(
                AppStrings.addProducts,
                fontSize: 20,
                fontFamily: FontFamily.medium,
              ),
              SizedBox(height: responsiveHeight(20)),
              CommonButton(
                text: AppStrings.uploadFile,
                bgColor: AppColors.white,
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.UPLOAD_FILE);
                },
                fontColor: AppColors.primary,
              ),
              SizedBox(height: responsiveHeight(20)),
              CommonButton(
                text: AppStrings.addProducts.replaceAll("s", ""),
                bgColor: AppColors.primary,
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.ADD_PRODUCT, arguments: {"cat_id" : controller.getCategoryData?.id})?.then((value) {
                    if(value != null){
                      controller.getProduct(isReset: true);
                    }
                  });
                },
                // fontColor: AppColors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
