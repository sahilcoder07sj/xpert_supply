import 'package:flutter/foundation.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/category/model/categories_list_model.dart';

import 'package:tbd_flutter/app/modules/vendor_categories_list/controllers/vendor_categories_list_controller.dart';
import 'package:tbd_flutter/app/modules/vendor_list/controllers/vendor_list_controller.dart';
import 'package:tbd_flutter/app/modules/vendor_list/model/vendor_list_model.dart';
import '../../../data/all.dart';

class VendorCategoriesListView extends GetView<VendorCategoriesListController> {
  const VendorCategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorCategoriesListController>(
      assignId: true,
      init: VendorCategoriesListController(),
      builder: (controller) {
        return CommonScreen(
          isLeading: true,
          title: controller.vendorName,
          actions: [
            GestureDetector(
              onTap: () => Get.toNamed(Routes.MY_CART),
              child: CommonWidget.circularIconWidget(
                icon: AppIcons.iconsCart,
                radius: 18.0,
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.MY_PROFILE),
              child: CommonWidget.circularIconWidget(
                icon: AppIcons.iconsUser,
                radius: 18.0,
              ),
            ),
            SizedBox(width: 10),
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
              itemCount: controller.vendorCategoriesData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                CategoryData data = controller.vendorCategoriesData[index];
                return GestureDetector(
                  onTap: () => Get.toNamed(
                    Routes.PRODUCT,
                    arguments: {
                      "cat_data":data,
                      // "categories_name":data.name,
                    }
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.0),
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: CommonWidget.commonShadowWidget(radius: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppText(
                            data.name ?? "Vendor",
                            fontSize: 15.0,
                            color: AppColors.primary,
                          ),
                        ),
                        SvgPicture.asset(AppIcons.iconsRightArrow)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

/// enter vendor code
/*

 */
