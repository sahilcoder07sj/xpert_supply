
import 'package:tbd_flutter/app/modules/editProduct/model/edit_product_model.dart';

import '../../../data/all.dart';

class ArchivedController extends GetxController {

  String noDatFound =  "";

  List productList = [
    {
      "name": "Arabic Ginger",
      "price": "\$25",
      "discounted_price": "\$25",
      "image": "assets/images/aadu.png",
    },
    {
      "name": "Organic Carrots",
      "price": "\$25",
      "discounted_price": "\$25",
      "image": "assets/images/gajar.png",
    },
    {
      "name": "Fresh Lettuce",
      "price": "\$25",
      "discounted_price": "\$25",
      "image": "assets/images/kobi.png",
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }

  unArchivedProduct({required int productId, required int categoryId}) async {
    FormData formData = FormData.fromMap({
      "category_id" : categoryId,
      "id" : productId,
      "status" : 0,
    });

    final data = await APIFunction().apiCall(
      apiName: Constants.updateProduct,
      context: Get.context!,
      params: formData,
      token: GetStorageData().readString(GetStorageData().token),
    );

    EditProduct model = EditProduct.fromJson(data);
    if(model.status == 1){
      // getProductList.removeAt(index);
    } else{
      CommonDialogue.alertActionDialogApp(message: data["message"]);
    }
  }
}
