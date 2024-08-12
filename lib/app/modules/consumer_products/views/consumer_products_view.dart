import 'package:tbd_flutter/app/data/responsive.dart';
import 'package:tbd_flutter/app/modules/consumer_products/controllers/consumer_products_controller.dart';
import '../../../data/all.dart';

class ConsumerProductsView extends GetView<ConsumerProductsController> {
  const ConsumerProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      isLeading: false,
      title: AppStrings.products,
      actions: [
        GestureDetector(
          onTap: () {},
          child: CommonWidget.circularIconWidget(
            icon: AppIcons.iconsCart,
            radius: 18.0,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {},
          child: CommonWidget.circularIconWidget(
            icon: AppIcons.iconsUser,
            radius: 18.0,
          ),
        ),
        SizedBox(width: 10),
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            children: [
              10.verticalSpace,
              SvgPicture.asset(AppIcons.productVendor)
            ],
          ),
        ),
      ),
    );
  }
}
