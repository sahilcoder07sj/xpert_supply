import 'package:tbd_flutter/app/modules/editProduct/model/edit_product_model.dart';
import 'package:tbd_flutter/app/modules/product/model/get_product_model.dart';
import '../../../data/all.dart';

class ArchivedController extends GetxController {

  String noDatFound =  "";
  Rxn<GetProduct> getCategory = Rxn<GetProduct>();
  RxString noData = "".obs;
  RxList<Products> getProductList = RxList();
  ScrollController scrollController = ScrollController();
  RxBool isPaginationLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  int pageLimit = 1;
  bool isDataLoaded = false;
  getProduct({bool isLoading = true, bool isReset = false}) async {
    noData.value = "";
    if (isReset){
      isDataLoaded = false;
      pageLimit = 1;
    }
    FormData formData = FormData.fromMap({
      "page": pageLimit,
      "limit": 10,
      "status": 0,
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
          }
          update();
        }
      } else {
        // CommonDialogue.alertActionDialogApp(message: model.message);
        noData.value = "no data found";

        update();
      }
    } catch (e) {
      noData.value = "no data found";
      update();
    }
  }

  unArchivedProduct({required int productId, required int index}) async {
    FormData formData = FormData.fromMap({
      "id" : productId,
      "status" : 1,
    });

    final data = await APIFunction().apiCall(
      apiName: Constants.updateProduct,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    EditProduct model = EditProduct.fromJson(data);
    if(model.status == 1){
      getProductList.removeAt(index);
      if(getProductList.isEmpty){
        noData.value = "no data found";
      }
    } else{
      CommonDialogue.alertActionDialogApp(message: data["message"]);
    }
  }
}
