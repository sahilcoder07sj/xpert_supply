import 'package:tbd_flutter/app/data/all.dart';
import '../controllers/add_edit_address_controller.dart';

class AddEditAddressView extends GetView<AddEditAddressController> {
  const AddEditAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditAddressController>(
      assignId: true,
      init: AddEditAddressController(),
      builder: (controller) {
        return CommonScreen(
          title: controller.isEditAddress
              ? AppStrings.editAddress
              : AppStrings.addAddress.replaceAll("+", ""),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  10.verticalSpace,
                  CommonTextFormField(
                    contentPadding: EdgeInsets.all(15.0),
                    title: AppStrings.houseNoBuildingName,
                    controller: controller.houseNoController,
                    hintText: "10 Furnival Street",
                  ),
                  20.verticalSpace,
                  CommonTextFormField(
                    contentPadding: EdgeInsets.all(15.0),
                    title: AppStrings.roadNameArea,
                    controller: controller.roanNameController,
                    hintText: "EC4A 1AB London, UK",
                  ),
                  20.verticalSpace,
                  CommonTextFormField(
                    contentPadding: EdgeInsets.all(15.0),
                    title: AppStrings.city,
                    controller: controller.cityController,
                    hintText: "London",
                  ),
                  20.verticalSpace,
                  CommonTextFormField(
                    contentPadding: EdgeInsets.all(15.0),
                    title: AppStrings.country,
                    controller: controller.countryController,
                    hintText: "United kingdom",
                  ),
                  20.verticalSpace,
                  CommonTextFormField(
                    contentPadding: EdgeInsets.all(15.0),
                    title: AppStrings.pinCode,
                    controller: controller.pincodeController,
                    hintText: "100 001",
                    textInputAction: TextInputAction.done,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    maxLength: 6,
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonButton(
                  text: controller.isEditAddress
                      ? AppStrings.save
                      : AppStrings.add,
                  onTap: () {
                    if (controller.addressValidation()) {
                      controller.addEditAddress();
                    }
                  },
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 10.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
