import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/myProfile/controllers/my_profile_controller.dart';
import 'package:tbd_flutter/app/modules/vendor_list/controllers/vendor_list_controller.dart';
import 'package:tbd_flutter/app/modules/vendor_list/model/vendor_list_model.dart';
import '../../../data/all.dart';

class VendorListView extends GetView<VendorListController> {
  const VendorListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorListController>(
      assignId: true,
      init: VendorListController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () {
            return controller.backMethod();
          },
          child: GestureDetector(
            onTap: () => Utils.hideKeyboard(),
            child: CommonScreen(
              isLeading: controller.vendorList.isEmpty
                  ? false
                  : controller.isAddVendor,
              leadingOnTap: controller.isAddVendor
                  ? () {
                      controller.isAddVendor = false;
                      controller.update();
                    }
                  : null,
              title: controller.isAddVendor
                  ? AppStrings.addVendor
                  : AppStrings.vendor + "s",
              floatingActionButton: !controller.isAddVendor
                  ? GestureDetector(
                      onTap: () {
                        controller.isAddVendor = true;
                        controller.update();
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add_rounded,
                            size: 30,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
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
                child: controller.isAddVendor
                    ? Center(
                        child: Column(
                          children: [
                            10.verticalSpace,
                            SvgPicture.asset(AppIcons.productVendor),
                            CommonTextFormField(
                              controller: controller.vendorCodeController,
                              hintText: AppStrings.enterVendorCode,
                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                UpperCaseTextFormatter(),
                              ],
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                              border: customOutlineInputBorder(
                                borderColor: AppColors.border.withOpacity(0.1),
                              ),
                              fillColor: AppColors.iconBG,
                              isShadow: false,
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.vendorList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          VendorListData data = controller.vendorList[index];
                          return GestureDetector(
                            onTap: () => Get.toNamed(Routes.VENDOR_CATEGORIES,
                                arguments: {
                                  "vendor_code": data.vendorNo,
                                  "vendor_name": data.name ?? "vendor name",
                                }),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(15.0),
                              margin: EdgeInsets.only(bottom: 10.0),
                              decoration:
                                  CommonWidget.commonShadowWidget(radius: 15.0),
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

              /// bottom button
              bottomNavigationBar: controller.isAddVendor
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonButton(
                            text: AppStrings.apply,
                            onTap: () {
                              if (controller
                                  .vendorCodeController.text.isNotEmpty) {
                                controller.addVendorApi();
                              } else {
                                CommonDialogue.alertActionDialogApp(
                                    message: "Please enter vendor code");
                              }
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).padding.bottom + 10.0),
                        ],
                      ),
                    )
                  : SizedBox(),
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
