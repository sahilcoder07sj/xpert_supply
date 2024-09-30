import 'package:image_picker/image_picker.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/data/pick_image.dart';
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
          Obx(() => CommonImageWidget(
            image: controller.selectImage.value != "" ? "" : controller.singleProductDetails.value?.data?.imageUrl ?? "",
            fileImage: controller.selectImage.value,
            cameraOnTap: () async {
              XFile? file = await PickImage.pickImageCamera();
              if(file != null){
                Get.back();
                controller.selectImage.value = file.path;
              }
            },
            galleryOnTap: () async {
              XFile? file = await PickImage.pickImageGallery();
              if(file != null){
                Get.back();
                controller.selectImage.value = file.path;
              }
            },
          )),
          30.verticalSpace,
          Container(height: 1, color: AppColors.divider),
          10.verticalSpace,
          CommonTextFormField(
            controller: controller.productNameController,
            title: AppStrings.productName,
            contentPadding: EdgeInsets.all(14.0),
          ),
          10.verticalSpace,
          CommonTextFormField(
            controller: controller.amountNameController,
            title: AppStrings.amount,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            contentPadding: EdgeInsets.all(14.0),
            maxLength: 3,
          ),
          10.verticalSpace,
          CommonTextFormField(
            controller: controller.discountNameController,
            title: AppStrings.discount,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            contentPadding: EdgeInsets.all(14.0),
            maxLength: 3,
          ),
          10.verticalSpace,
          CommonTextFormField(
            controller: controller.descriptionNameController,
            hintText: AppStrings.description,
            title: AppStrings.description,
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            maxLines: 5,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonButton(
                text: AppStrings.save,
              onTap: () => controller.updateProduct(),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom+10.0),
          ],
        ),
      ),
    );
  }
}
