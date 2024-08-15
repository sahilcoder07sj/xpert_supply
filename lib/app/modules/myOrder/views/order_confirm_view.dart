import 'package:tbd_flutter/app/modules/myOrder/controllers/my_order_controller.dart';

import '../../../data/all.dart';

class OrderConfirmView extends GetView<MyOrderController> {
  const OrderConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      isAppbar: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.iconsTickBig),
              30.verticalSpace,
              AppText(
                  AppStrings.yourOrderIsConfirm,
                fontSize: 22.0,
              ),
              20.verticalSpace,
              CommonButton(
                  text: AppStrings.done,
                onTap: () => Get.offAllNamed(Routes.CONSUMER_PRODUCTS),
              )
            ],
          ),
        ),
      ),
    );
  }
}
