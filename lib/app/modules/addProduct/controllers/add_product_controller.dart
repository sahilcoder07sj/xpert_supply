import 'package:image_picker/image_picker.dart';
import 'package:tbd_flutter/app/CommonWidget/camera_bottom_sheet.dart';
import 'package:tbd_flutter/app/data/pick_image.dart';
import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/addProduct/model/add_product_model.dart';
import '../../../data/all.dart';

class AddProductController extends GetxController {

  TextEditingController productNameController = TextEditingController();
  TextEditingController productAmountController = TextEditingController();
  TextEditingController productDiscountController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  RxList<String> selectImageList = RxList();
  RxBool isPickImage = true.obs;

  final count = 0.obs;
  int catId = 0;

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      catId = Get.arguments["cat_id"];
    }
  }

  bool validation(){
    if(productNameController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.pleaseEnterProductName);
      return false;
    } else if(productAmountController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.pleaseEnterAmount);
      return false;
    } /*else if(productDiscountController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.pleaseEnterDiscount);
      return false;
    } else if(int.parse(productAmountController.text) <= int.parse(productDiscountController.text)){
      CommonDialogue.alertActionDialogApp(message: AppStrings.discountAmountShouldBeLessThanAmount);
      return false;
    } */else if(productDescriptionController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.pleaseEnterDescription);
      return false;
    } else if(selectImageList.length == 0){
      CommonDialogue.alertActionDialogApp(message: AppStrings.pleaseEnterDescription);
      return false;
    }
    return true;
  }

  addProduct() async {
    double? discount;
    if(productDiscountController.text.isNotEmpty){
      discount = Utils.calculateDiscountedPrice(double.parse(productAmountController.text), double.parse(productDiscountController.text));
    }
    if(validation()){
      FormData formData = FormData.fromMap({
        "category_id" : catId,
        "name" : productNameController.text,
        "amount" : int.parse(productAmountController.text),
        "description" : productDescriptionController.text,
      });

      if(discount != null){
        formData.fields.add(MapEntry("discount", discount.toStringAsFixed(0)));
      }

      if (selectImageList.isNotEmpty) {
        for(int i = 0 ; i < selectImageList.length ; i++){
          formData.files.addAll([
            MapEntry(
              "images[]",
              await MultipartFile.fromFile(selectImageList[i], filename: selectImageList[i].split("/").last),
            )
          ]);
        }
      }

      final data = await APIFunction().apiCall(
        apiName: Constants.addProduct,
        context: Get.context!,
        params: formData,
        token: GetStorageData().readString(GetStorageData().token),
      );

      AddProduct model = AddProduct.fromJson(data);
      if(model.status == 1){
        Get.back(result: true);
      } else{
        CommonDialogue.alertActionDialogApp(message: model.message);
      }
    }
  }

  void pickProductImage() {
    Get.bottomSheet(
      isScrollControlled: true,
      CameraGallerySheet(
        cameraOnTap: () async {
          XFile? file = await PickImage.pickImageCamera();
          if(file != null){
            Get.back();
            selectImageList.clear();
            selectImageList.insert(0, file.path);
            if(selectImageList.length == 1){
              isPickImage.value = false;
            }
          }
        },
        galleryOnTap: () async {
          XFile? file = await PickImage.pickImageGallery();
          if(file != null){
            Get.back();
            selectImageList.clear();
            selectImageList.insert(0, file.path);
            if(selectImageList.length == 1){
              isPickImage.value = false;
            }
          }
        },
      ),
    );
  }

}
