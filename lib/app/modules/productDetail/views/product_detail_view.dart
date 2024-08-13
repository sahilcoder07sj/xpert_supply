import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/data/all.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: "Product Details",
      extendBodyBehindAppBar: true,
      appBarBackgroundColor: Colors.transparent,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 300,
            padding: EdgeInsets.only(top: AppBar().preferredSize.height),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.iconBG,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(130))),
            child: Center(
              child: Image.asset(
                "assets/images/aadu.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
