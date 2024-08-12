

import 'package:get/get.dart';

class ProductController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

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
    {
      "name": "Fresh Broccoli",
      "price": "\$25",
      "discounted_price": "\$25",
      "image": "assets/images/lili_kobi.png",
    },
    {
      "name": "Bell Pepper Red",
      "price": "\$25",
      "discounted_price": "\$25",
      "image": "assets/images/marcha.png",
    },
    {
      "name": "Butternut Squash ",
      "price": "\$25",
      "discounted_price": "\$25",
      "image": "assets/images/papaiyu.png",
    },
  ];
}
