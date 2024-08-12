import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/data/responsive.dart';

import '../controllers/add_edit_category_controller.dart';

class AddEditCategoryView extends GetView<AddEditCategoryController> {
  const AddEditCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditCategoryController>(
      assignId: true,
      init: AddEditCategoryController(),
      builder: (controller) {
        return CommonScreen(
          title: controller.isEdit
              ? AppStrings.editCategory
              : AppStrings.addCategory,
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: [
              SizedBox(height: responsiveHeight(25)),
              CommonTextFormField(
                controller: controller.categoryController,
                hintText: AppStrings.categoryName,
                title: AppStrings.categoryName,
                prefixIcon: AppIcons.iconsProduct,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: responsiveHeight(35)),
              CommonButton(
                  text: controller.isEdit
                      ? AppStrings.save
                      : AppStrings.addCategory)
            ],
          ),
        );
      },
    );
  }
}
