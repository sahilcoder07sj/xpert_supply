import 'package:tbd_flutter/app/data/utils.dart';
import 'package:tbd_flutter/app/modules/delivery/model/add_delivery_model.dart';
import 'package:tbd_flutter/app/modules/login/model/login_user_model.dart';
import '../../../data/all.dart';


class DeliveryController extends GetxController {

  TextEditingController normalDeliveryDaysController = TextEditingController();
  TextEditingController fastDeliveryDaysController = TextEditingController();
  TextEditingController fastDeliveryChargesController = TextEditingController();
  bool isUpdate = false;
  RxBool isFastDelivery = false.obs;
  LoginUserData? loginUserData;

  @override
  void onInit() {
    if(GetStorageData().containKey(GetStorageData().userData)) {
      loginUserData = LoginUserData.fromJson(GetStorageData().readObject(GetStorageData().userData));
    }
    if(Get.arguments != null){
      isUpdate = Get.arguments["is_check"];
      if(isUpdate){
        normalDeliveryDaysController.text = loginUserData?.normalDeliveryDays.toString() ?? "";
        fastDeliveryDaysController.text = loginUserData?.fastDeliveryDays.toString() ?? "";
        fastDeliveryChargesController.text = loginUserData?.fastDeliveryCharges.toString() ?? "";
        isFastDelivery.value = loginUserData?.isFastDelivery ?? false;
      }
    }
    super.onInit();
  }

  bool validation(){
    if(normalDeliveryDaysController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterDeliveryDays);
      return false;
    } else if(fastDeliveryDaysController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterFastDeliveryDays);
      return false;
    } else if(fastDeliveryChargesController.text.isEmpty){
      CommonDialogue.alertActionDialogApp(message: AppStrings.enterFastDeliveryCharges);
      return false;
    }
    return true;
  }

  addDelivery() async {
    if(validation()){
      Map map = {
        'normal_delivery_days': int.parse(normalDeliveryDaysController.text),
        'is_fast_delivery': isFastDelivery.value,
        'fast_delivery_days': int.parse(fastDeliveryDaysController.text),
        'fast_delivery_charges': int.parse(fastDeliveryChargesController.text),
      };
      final data = await APIFunction().apiCall(
        apiName: Constants.delivery,
        withOutFormData: map,
        context: Get.context!,
        token: GetStorageData().readString(GetStorageData().token),
      );

      AddDeliveryModel model = AddDeliveryModel.fromJson(data);
      if(model.status == 1){
        loginUserData?.normalDeliveryDays = model.data?.normalDeliveryDays ?? null;
        loginUserData?.fastDeliveryDays = model.data?.fastDeliveryDays ?? null;
        loginUserData?.fastDeliveryCharges = model.data?.fastDeliveryCharges ?? null;
        loginUserData?.isFastDelivery = model.data?.isFastDelivery ?? false;
        await GetStorageData().saveObject(GetStorageData().userData, loginUserData?.toJson());
        Utils.flutterToast(model.message);
        if(isUpdate){
          Get.back();
        } else{
          Get.offAllNamed(Routes.MANAGEMENT);
        }
      } else{
        CommonDialogue.alertActionDialogApp(message: model.message);
      }
    }
  }

}
