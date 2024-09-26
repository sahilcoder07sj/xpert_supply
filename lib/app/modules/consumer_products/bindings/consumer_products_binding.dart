import 'package:get/get.dart';

import '../controllers/consumer_products_controller.dart';

class ConsumerProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsumerProductsController>(
      () => ConsumerProductsController(),
    );
  }
}
