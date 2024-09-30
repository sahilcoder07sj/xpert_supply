import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';
import 'package:tbd_flutter/app/data/all.dart';
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
            keyboardType: TextInputType.numberWithOptions(signed: true),
            textInputAction: TextInputAction.next,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            maxLength: 3,
          ),
          SizedBox(height: 20),
          CommonTextFormField(
            controller: controller.productDiscountController,
            hintText: AppStrings.discount,
            prefixIcon: AppIcons.iconsDiscount,
            textInputAction: TextInputAction.next,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.numberWithOptions(signed: true),
            maxLength: 3,
          ),
          SizedBox(height: 20),
          CommonTextFormField(
            controller: controller.productDescriptionController,
            hintText: AppStrings.description,
            title: AppStrings.description,
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            maxLines: 5,
          ),
          SizedBox(height: 20),
          Obx(() => GestureDetector(
            onTap: () => controller.pickProductImage(),
            child: DottedBorder(
                color: Color(0xffB9B9B9),
                dashPattern: [8, 4],
                strokeWidth: 2,
                radius: Radius.circular(10),
                borderType: BorderType.RRect,
                child: controller.selectImageList.isNotEmpty ? Center(
                  child: SizedBox(
                    width: 120.0,
                    height: 170.0,
                    child: Image.file(
                      File(controller.selectImageList.first),
                      fit: BoxFit.cover,
                    ),
                  ),
                ) : Container(
                  width: double.infinity,
                  height: 170.0,
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
          )),
          SizedBox(height: 30),
          CommonButton(
            text: AppStrings.save,
            onTap: () => controller.addProduct(),
          )
        ],
      ),
    );
  }
}

/*
Obx(() => controller.selectImageList.isNotEmpty ? SizedBox(
            height: 170.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.selectImageList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    controller.isPickImage.value && 0 == index ? Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () => controller.pickProductImage(),
                        child: DottedBorder(
                          color: Color(0xffB9B9B9),
                          dashPattern: [8, 4],
                          strokeWidth: 2,
                          radius: Radius.circular(10),
                          borderType: BorderType.RRect,
                          child: Container(
                            height: 170,
                            width: 120,
                            child: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset(
                                AppIcons.iconsUploadImage,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ) : SizedBox(),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 120.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: FileImage(
                                  File(controller.selectImageList[index]),
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                        Positioned(
                          right: 15.0,
                          top: 8.0,
                          child: GestureDetector(
                            onTap: () {
                              controller.selectImageList.removeAt(index);
                              if(controller.selectImageList.length < 3){
                                controller.isPickImage.value = true;
                              }
                            },
                            child: CircleAvatar(
                              radius: 10.0,
                              backgroundColor: AppColors.red,
                              child: Icon(
                                  Icons.close,
                                color: AppColors.white,
                                size: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },),
          )
              : GestureDetector(
            onTap: () => controller.pickProductImage(),
            child: DottedBorder(
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
          )),
 */