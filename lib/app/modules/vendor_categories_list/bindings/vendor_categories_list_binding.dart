import 'package:get/get.dart';
import 'package:tbd_flutter/app/modules/vendor_categories_list/controllers/vendor_categories_list_controller.dart';



class VendorCategoriesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorCategoriesListController>(
      () => VendorCategoriesListController(),
    );
  }
}
