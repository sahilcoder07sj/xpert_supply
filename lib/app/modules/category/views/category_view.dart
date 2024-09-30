import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tbd_flutter/app/data/all.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.category,
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.ADD_EDIT_CATEGORY, arguments: {
              "is_edit": false,
            })?.then((value) {
              if(value != null){
                controller.getCategoryList(isLoader: false);
              }
            });
          },
          child: CommonWidget.circularIconWidget(
            icon: AppIcons.iconsPlus,
            radius: 14,
            backgroundColor: AppColors.primary,
          ),
        ),
        SizedBox(width: 10)
      ], 
      body: Obx(() => controller.getCategory.value != null ? controller.categoryList.isNotEmpty ? ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        itemCount: controller.categoryList.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.3,
              children: [
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.ADD_EDIT_CATEGORY, arguments: {
                        "is_edit": true,
                        "data" : controller.categoryList[index],
                        "index" : index,
                      });
                    },
                    child: Container(
                      height: responsiveHeight(50),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                            AppIcons.iconsEditDeliveryAddress,
                            color: AppColors.white,
                          )),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => controller.deleteCategory(id: controller.categoryList[index].id ?? 0, index: index),
                    child: Container(
                      height: responsiveHeight(50),
                      decoration: BoxDecoration(
                        color: AppColors.bluePrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                            AppIcons.iconsDelete,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.PRODUCT, arguments: {"cat_data" : controller.categoryList[index]});
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: responsiveHeight(50),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        offset: Offset(0, 7),
                        blurRadius: 20,
                      )
                    ]),
                child: Row(
                  children: [
                    AppText(
                      controller.categoryList[index].name ?? "",
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
      )
          : CommonWidget.noDataFoundWidget() : SizedBox()),
    );
  }
}
