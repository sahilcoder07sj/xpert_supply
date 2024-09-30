import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/category/model/get_category_model.dart';

import '../../../data/all.dart';

class CategoryController extends GetxController with SingleGetTickerProviderMixin{

  RxList<GetCategoryData> categoryList = RxList<GetCategoryData>();
  Rxn<GetCategory> getCategory = Rxn<GetCategory>();

  @override
  void onInit() {
    super.onInit();
    getCategoryList();
  }

  getCategoryList({bool isLoader = true}) async {
    FormData formData = FormData.fromMap({});
    final data = await APIFunction().apiCall(
      apiName: Constants.getCategory,
      context: Get.context!,
      params: formData,
      isLoading: isLoader,
      token: GetStorageData().readString(GetStorageData().token),
    );

    GetCategory model = GetCategory.fromJson(data);
    if(model.status == 1){
      getCategory.value = model;
      categoryList.clear();
      categoryList.addAll(model.data?.reversed ?? []);
    }
  }

  deleteCategory({required int id, required int index}) async {
    FormData formData = FormData.fromMap({
      "id" : id,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants.deleteCategory,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );
    
    if(data["status"] == 1){
      categoryList.removeAt(index);
      Utils.flutterToast(data["message"]);
    } else{
      CommonDialogue.alertActionDialogApp(message: data["message"]);
    }
  }
}
