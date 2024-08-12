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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: responsiveHeight(10)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: CommonWidget.commonShadowWidget(radius: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: responsiveHeight(10)),
                  AppText(
                    AppStrings.normalDelivery,
                    fontSize: 18,
                    fontFamily: FontFamily.medium,
                  ),
                  SizedBox(height: responsiveHeight(15)),
                  Row(
                    children: [
                      AppText(
                        AppStrings.deliveryDays + ":",
                        fontFamily: FontFamily.regular,
                        fontSize: 17,
                      ),
                      SizedBox(width: responsiveWidth(5)),
                      Container(
                        height: responsiveHeight(45),
                        width: responsiveWidth(45),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.border.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(11.0),
                            color: AppColors.iconBG),
                        child: TextFormField(
                          controller: controller.normalDeliveryDaysController,
                          textAlign: TextAlign.center,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(15)),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(15)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20 ),
              width: double.infinity,
              decoration: CommonWidget.commonShadowWidget(radius: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: responsiveHeight(10)),
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          AppStrings.fastDelivery,
                          fontSize: 18,
                          fontFamily: FontFamily.medium,
                        ),
                      ),
                      Obx(
                        () => SizedBox(
                          width: responsiveWidth(50.0),
                          height: responsiveHeight(40.0),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              focusColor: AppColors.primary,
                              activeColor: Colors.black,
                              inactiveTrackColor:
                                  AppColors.primary.withOpacity(0.3),
                              trackOutlineColor:
                                  WidgetStatePropertyAll(Colors.transparent),
                              thumbColor:
                                  WidgetStatePropertyAll(AppColors.white),
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
                  SizedBox(height: responsiveHeight(15)),
                  AppText(
                    AppStrings.deliveryDays,
                    fontSize: 14,
                    fontFamily: FontFamily.medium,
                  ),
                  SizedBox(height: responsiveHeight(5)),
                  CommonTextFormField(
                    controller: controller.fastDeliveryDaysController,
                    border: customOutlineInputBorder(
                      borderColor: AppColors.border.withOpacity(0.1),
                    ),
                    fillColor: AppColors.iconBG,
                    isShadow: false,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  ),
                  SizedBox(height: responsiveHeight(15)),
                  AppText(
                    AppStrings.deliveryCharges,
                    fontSize: 14,
                    fontFamily: FontFamily.medium,
                  ),
                  SizedBox(height: responsiveHeight(5)),
                  CommonTextFormField(
                    controller: controller.fastDeliveryChargesController,
                    border: customOutlineInputBorder(
                      borderColor: AppColors.border.withOpacity(0.1),
                    ),
                    fillColor: AppColors.iconBG,
                    isShadow: false,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10,horizontal: 10),
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
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.0),
          ],
        ),
      ),
    );
  }
}
