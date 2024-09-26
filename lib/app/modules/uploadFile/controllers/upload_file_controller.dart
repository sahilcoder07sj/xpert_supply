import 'package:file_picker/file_picker.dart';

import '../../../data/all.dart';

class UploadFileController extends GetxController {

  @override
  void onInit() {
    precacheImage(AssetImage(AppIcons.sampleFile), Get.context!);
    super.onInit();
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if(result != null){
      print("file : ${result.files.first.path}");
    }
  }
}
