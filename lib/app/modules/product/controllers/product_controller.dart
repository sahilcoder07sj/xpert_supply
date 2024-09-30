import 'package:tbd_flutter/app/api_repository/api_function.dart';
import 'package:tbd_flutter/app/api_repository/get_storage.dart';
import 'package:tbd_flutter/app/modules/category/model/categories_list_model.dart';
import 'package:tbd_flutter/app/modules/category/model/get_category_model.dart';
import 'package:tbd_flutter/app/modules/editProduct/model/edit_product_model.dart';
import 'package:tbd_flutter/app/modules/product/model/get_product_model.dart';

import '../../../data/all.dart';
import '../../vendor_list/model/product_list_model.dart';
import '../../../data/all.dart';

class ProductController extends GetxController {
  RxList<Products> getProductList = RxList();
  ScrollController scrollController = ScrollController();
  Rxn<GetProduct> getCategory = Rxn<GetProduct>();
  RxBool isPaginationLoading = false.obs;
  int selectIndex = 0;
  CategoryData? getCategoryData;
  RxString noData = "".obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(onScroll);
    if (Get.arguments != null) {
      getCategoryData = Get.arguments["cat_data"];
    }
    getProduct();
  }

  void onScroll() {
    // if (scrollController.position.extentAfter <= 0 && getProductList.length < (getCategory.value?.data?.total ?? 0) && !isPaginationLoading.value) {
    if (scrollController.position.extentAfter <= 0 &&
        !isDataLoaded &&
        !isPaginationLoading.value) {
      isPaginationLoading.value = true;
      pageLimit++;
      getProduct(isLoading: false);
    }
  }

  int pageLimit = 1;
  bool isDataLoaded = false;

  getProduct({bool isLoading = true, bool isReset = false}) async {
    noData.value = "";
    if (isReset) pageLimit = 1;
    FormData formData = FormData.fromMap({
      "category_id": getCategoryData?.id ?? 0,
      "page": pageLimit,
      "limit": 10,
    });

    try {
      final data = await APIFunction().apiCall(
        apiName: Constants.getProduct,
        context: Get.context!,
        params: formData,
        isLoading: isLoading,
        token: GetStorageData().readString(GetStorageData().token),
      );

      GetProduct model = GetProduct.fromJson(data);
      if (model.status == 1) {
        getCategory.value = model;
        if (isReset) getProductList.clear();
        if (model.data?.products != null && model.data!.products!.isNotEmpty) {
          getProductList.addAll(model.data?.products ?? []);
          if (getProductList.length == (getCategory.value?.data?.total ?? 0)) {
            isDataLoaded = true;
          }
          isPaginationLoading.value = false;
        } else {
          if (pageLimit == 1) {
            noData.value = "No data found";
            print("noDatanoDatanoDatanoDatanoData");
          }
          update();
        }
      } else {
        CommonDialogue.alertActionDialogApp(message: model.message);
        noData.value = "no data found";

        update();
      }
    } catch (e) {
      print("} catch (e) {");
      noData.value = "no data found";
      update();
    }
  }

  addArchive({required int productId, required int index}) async {
    FormData formData = FormData.fromMap({
      "category_id": getCategory.value?.data?.categoryId ?? "",
      "id": productId,
      "status": 1,
    });

    final data = await APIFunction().apiCall(
      apiName: Constants.updateProduct,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    EditProduct model = EditProduct.fromJson(data);
    if (model.status == 1) {
      getProductList.removeAt(index);
    } else {
      CommonDialogue.alertActionDialogApp(message: data["message"]);
    }
  }
}
