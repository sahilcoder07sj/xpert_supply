import 'package:flutter/services.dart';
import 'package:tbd_flutter/app/modules/delivery/controllers/delivery_controller.dart';
import '../../../data/all.dart';

class DeliveryView extends GetView<DeliveryController> {
  const DeliveryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.delivery,
      isLeading: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            20.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              width: double.infinity,
              decoration: CommonWidget.commonShadowWidget(
                radius: 15.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  AppText(
                      AppStrings.normalDelivery,
                    fontSize: 20.0,
                    fontFamily: FontFamily.medium,
                  ),
                  14.verticalSpace,
                  Row(
                    children: [
                      AppText(
                          AppStrings.deliveryDays+":",
                        fontFamily: FontFamily.regular,
                        fontSize: 16.0,
                      ),
                      5.horizontalSpace,
                      Container(
                        height: 45.0,
                        width: 45.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.border.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(11.0),
                          color: AppColors.iconBG
                        ),
                        child: TextFormField(
                          controller: controller.normalDeliveryDaysController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                ],
              ),
            ),
            12.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              width: double.infinity,
              decoration: CommonWidget.commonShadowWidget(
                  radius: 15.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          AppStrings.fastDelivery,
                          fontSize: 20.0,
                          fontFamily: FontFamily.medium,
                        ),
                      ),
                      Obx(() => SizedBox(
                        width: 50.0,
                        height: 40.0,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            focusColor: AppColors.primary,
                              activeColor: Colors.black,
                              inactiveTrackColor: AppColors.primary.withOpacity(0.3),
                              trackOutlineColor: WidgetStatePropertyAll(Colors.transparent  ),
                              thumbColor: WidgetStatePropertyAll(AppColors.white),
                              value: controller.isFastDelivery.value,
                              onChanged: (value) {
                                controller.isFastDelivery.value = value;
                              },
                            ),
                        ),
                      ),
                      )
                    ],
                  ),
                  14.verticalSpace,
                  AppText(
                      AppStrings.deliveryDays,
                    fontSize: 16.0,
                    fontFamily: FontFamily.medium,
                  ),
                  7.verticalSpace,
                  CommonTextFormField(
                    controller: controller.fastDeliveryDaysController,
                    border: customOutlineInputBorder(
                      borderColor: AppColors.border.withOpacity(0.1),
                    ),
                    fillColor: AppColors.iconBG,
                    isShadow: false,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    contentPadding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
                  ),
                  12.verticalSpace,
                  AppText(
                    AppStrings.deliveryCharges,
                    fontSize: 16.0,
                    fontFamily: FontFamily.medium,
                  ),
                  7.verticalSpace,
                  CommonTextFormField(
                    controller: controller.fastDeliveryChargesController,
                    border: customOutlineInputBorder(
                      borderColor: AppColors.border.withOpacity(0.1),
                    ),
                    fillColor: AppColors.iconBG,
                    isShadow: false,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    contentPadding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
                  ),
                  35.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonButton(
                text: AppStrings.next,
              onTap: () {
                Get.offAllNamed(Routes.CATEGORY);
              } ,
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.0),
          ],
        ),
      ),
    );
  }
}
