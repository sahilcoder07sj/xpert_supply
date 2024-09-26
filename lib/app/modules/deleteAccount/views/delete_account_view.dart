import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/CommonWidget/common_botttom_sheet.dart';
import 'package:tbd_flutter/app/CommonWidget/screen.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/modules/myProfile/controllers/my_profile_controller.dart';

import '../controllers/delete_account_controller.dart';

class DeleteAccountView extends GetView<DeleteAccountController> {
  const DeleteAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.deleteAccount,
      body: ListView.builder(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        itemCount: controller.deleteList.length,
        itemBuilder: (context, index) {
          CommonModel data = controller.deleteList[index];
          return GestureDetector(
            onTap: () {
              controller.deleteList.forEach((element) {
                element.isCheck?.value = false;
              });
              controller.deleteList[index].isCheck?.value = true;
            },
            child: Obx(() => Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: CommonWidget.commonShadowWidget(
                    radius: 15.0,
                    borderSide: BorderSide(
                      color: data.isCheck?.value == true ? AppColors.primary : Color(0xFFF2F2F6)
                    ),
                  ),
                  child: AppText(
                      data.title ?? "",
                    fontSize: 15.0,
                    color: AppColors.primary,
                  ),
                ),
                Obx(() => data.isCheck?.value == true && controller.deleteList.length-1 == index ? Container(
                  padding: EdgeInsets.only(left: 15.0, top: 15.0),
                  height: 150.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFEFF0F3),
                        blurRadius: 20.40,
                        offset: Offset(0, 7),
                        spreadRadius: 0,
                      )
                    ],
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.white,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppIcons.iconsMessage),
                      10.horizontalSpace,
                      Expanded(
                        child: CommonTextFormField(
                          isShadow: false,
                          controller: controller.messageController,
                          maxLines: 5,
                          contentPadding: EdgeInsets.zero,
                          hintText: AppStrings.iAMLeavingBecause,
                          fillColor: AppColors.white,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ],
                  ),
                ) : SizedBox()),
                10.verticalSpace,
              ],
            )),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonButton(
                text: AppStrings.deleteMyAccount,
              onTap: () {
                Get.bottomSheet(
                  CommonBottomSheet(
                    title: AppStrings.deleteMyAccount,
                    subTitle: AppStrings.areYouSureYouWantToDeleteYourAccount,
                    image: AppIcons.iconsDeleteBig,
                    iconBgColor: AppColors.red.withOpacity(0.1),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.0),
          ],
        ),
      ),
    );
  }
}
