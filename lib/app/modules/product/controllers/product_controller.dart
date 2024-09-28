import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';

import '../../../data/all.dart';
import '../../vendor_list/model/product_list_model.dart';

class ProductController extends GetxController {
  List<ProductsData> productsList = [];
  String noData = "";
  String categoriesId = "";
  String categoriesName = "";

  @override
  void onInit() {
    if (Get.arguments != null) {
      categoriesId = Get.arguments["categories_id"].toString();
      categoriesName = Get.arguments["categories_name"];
      getProductApi(categoryId: categoriesId);
    }
    super.onInit();
  }

  String noDatFound = "";

  getProductApi({String? categoryId}) async {
    FormData formData = FormData.fromMap({
      "category_id": categoryId,
    });
    try {
      final data = await APIFunction().apiCall(
        apiName: Constants().productList,
        context: Get.context!,
        params: formData,
        token: GetStorageData().readString(GetStorageData().token),
      );
      ProductListModel productListModel = ProductListModel.fromJson(data);
      if (productListModel.status == 1) {
        if (productListModel.data!.products!.isNotEmpty) {
          productsList = productListModel.data!.products ?? [];
        } else {
          noDatFound = "No product found!";
        }
        update();
      } else {
        CommonDialogue.alertActionDialogApp(message: productListModel.message);
      }
    } catch (e) {
      noDatFound = "No product found!";
      update();
    }
  }
}
