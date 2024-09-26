import 'package:get/get.dart';

import '../controllers/quate_controller.dart';

class QuateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuateController>(
      () => QuateController(),
    );
  }
}
