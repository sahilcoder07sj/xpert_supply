import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/CommonWidget/screen.dart';
import 'package:tbd_flutter/app/data/all.dart';

import '../controllers/edit_product_controller.dart';
import '../widget/camera_widget.dart';

class EditProductView extends GetView<EditProductController> {
  const EditProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.editProduct,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          CommonImageWidget(),
          SizedBox(height: 30),
          Container(height: 1, color: AppColors.divider),
          SizedBox(height: 10),
          CommonTextFormField(
            title: AppStrings.productName,
            hintText: "Banana",
          ),
        ],
      ),
    );
  }
}
