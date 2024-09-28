import 'package:tbd_flutter/app/modules/vendor_list/model/product_list_model.dart';

class MyCartModel {
  final int? status;
  final String? message;
  final MyCartData? data;

  MyCartModel({
    this.status,
    this.message,
    this.data,
  });

  MyCartModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? MyCartData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class MyCartData {
  final int? cartId;
  final int? orderId;
  final List<ProductsData>? products;

  MyCartData({
    this.cartId,
    this.products,
    this.orderId,
  });

  MyCartData.fromJson(Map<String, dynamic> json)
      : cartId = json['cart_id'] as int?,
       orderId = json['order_id'] as int?,
        products = (json['products'] as List?)?.map((dynamic e) => ProductsData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'cart_id' : cartId,
    'order_id' : orderId,
    'products' : products?.map((e) => e.toJson()).toList()
  };
}

