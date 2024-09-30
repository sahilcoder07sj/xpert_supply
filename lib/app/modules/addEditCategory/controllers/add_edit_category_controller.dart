import 'package:tbd_flutter/app/modules/addEditCategory/model/add_category_model.dart';
import 'package:tbd_flutter/app/modules/category/controllers/category_controller.dart';
import 'package:tbd_flutter/app/modules/category/model/get_category_model.dart';

import '../../../data/all.dart';

class AddEditCategoryController extends GetxController {

  TextEditingController categoryController = TextEditingController();
  GetCategoryData? getCategoryData;
  bool isEdit = false;
  int index = 0;

  @override
  void onInit() {
    if (Get.arguments != null) {
      isEdit = Get.arguments["is_edit"];
      if(Get.arguments["data"] != null){
        getCategoryData = Get.arguments["data"];
        index = Get.arguments["index"];
        categoryController.text = getCategoryData?.name ?? "";
      }
    }
    super.onInit();
  }

  addCategory() async {
    FormData formData = FormData.fromMap({
      "name" : categoryController.text,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants.addCategory,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    AddCategory model = AddCategory.fromJson(data);
    if(model.status == 1){
      Get.back(result: true);
    } else{
      CommonDialogue.alertActionDialogApp(message: model.message);
    }
  }

  editCategory() async {
    FormData formData = FormData.fromMap({
      "id" : getCategoryData?.id ?? 0,
      "name" : categoryController.text,
      "status" : 1,
    });
    final data = await APIFunction().apiCall(
      apiName: Constants.updateCategory,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    AddCategory model = AddCategory.fromJson(data);
    if(model.status == 1){
      Get.find<CategoryController>().categoryList[index].name = categoryController.text;
      Get.find<CategoryController>().categoryList.refresh();
      Get.back();
    } else{
      CommonDialogue.alertActionDialogApp(message: model.message);
    }
  }
}
