import 'package:get/get.dart';

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
}
