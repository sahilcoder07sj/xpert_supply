import 'package:get/get.dart';

import '../controllers/add_edit_category_controller.dart';

class AddEditCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditCategoryController>(
      () => AddEditCategoryController(),
    );
  }
}
