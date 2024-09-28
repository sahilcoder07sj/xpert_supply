import 'package:tbd_flutter/app/modules/editProfile/controllers/edit_profile_controller.dart';

import '../../../data/all.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      assignId: true,
      init: EditProfileController(),
      builder: (controller) {
        return CommonScreen(
          title: AppStrings.editProfile,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                20.verticalSpace,
                CommonTextFormField(
                  controller: controller.nameController,
                  hintText: AppStrings.name,
                  prefixIcon: AppIcons.iconsPerson,
                  keyboardType: TextInputType.name,
                ),
                15.verticalSpace,
                CommonTextFormField(
                  controller: controller.emailController,
                  hintText: AppStrings.email,
                  prefixIcon: AppIcons.iconsEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                if(Constants.selectUser == Constants.vendor)...[
                  15.verticalSpace,
                  CommonTextFormField(
                    controller: controller.companyNameController,
                    hintText: AppStrings.businessName,
                    prefixIcon: AppIcons.iconsBusiness,
                    textInputAction: TextInputAction.done,
                  ),
                ],
                35.verticalSpace,
                CommonButton(
                  text: AppStrings.changePassword,
                  bgColor: AppColors.white,
                  borderColor: AppColors.primary,
                  fontColor: AppColors.primary,
                  onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD),
                ),
                20.verticalSpace,
                CommonButton(
                  text: AppStrings.save,
                  onTap: () {
                    if(controller.validation()){
                      controller.addEditProfile();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
