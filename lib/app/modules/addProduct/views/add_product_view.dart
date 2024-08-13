import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/CommonWidget/screen.dart';
import 'package:tbd_flutter/app/CommonWidget/text_form_field.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/data/app_icons.dart';
import 'package:tbd_flutter/app/data/app_strings.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.addProducts,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          SizedBox(height: 15),
          CommonTextFormField(
            controller: controller.productNameController,
            hintText: AppStrings.productName,
            prefixIcon: AppIcons.iconsProduct,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 20),
          CommonTextFormField(
            controller: controller.productAmountController,
            hintText: AppStrings.amount,
            prefixIcon: AppIcons.iconsAmount,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 20),
          CommonTextFormField(
            controller: controller.productDiscountController,
            hintText: AppStrings.discount,
            prefixIcon: AppIcons.iconsDiscount,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 20),
          CommonTextFormField(
            controller: controller.productDescriptionController,
            hintText: AppStrings.description,
            title: AppStrings.description,
            textInputAction: TextInputAction.next,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            maxLines: 5,
          ),
          SizedBox(height: 20),
          DottedBorder(
            color: Color(0xffB9B9B9),
            dashPattern: [8, 4],
            strokeWidth: 2,
            radius: Radius.circular(10),
            borderType: BorderType.RRect,
            child: Container(
              height: 170,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.iconsUploadImage,
                  ),
                  SizedBox(height: 8),
                  AppText(
                    AppStrings.uploadImagesHere,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          CommonButton(
            text: AppStrings.save,
          )
        ],
      ),
    );
  }
}
