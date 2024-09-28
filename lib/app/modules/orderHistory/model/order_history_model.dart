import 'package:tbd_flutter/app/modules/addEditAddress/model/add_edit_address_model.dart';
import 'package:tbd_flutter/app/modules/vendor_list/model/product_list_model.dart';

class OrderHistoryModel {
  final int? status;
  final String? message;
  final List<OrderHistoryData>? data;

  OrderHistoryModel({
    this.status,
    this.message,
    this.data,
  });

  OrderHistoryModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => OrderHistoryData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class OrderHistoryData {
  final int? orderId;
  final String? status;
  final String? uniqueOrderId;
  final String? totalAmount;
  final String? deliveryDate;
  final int? isFastDelivery;
  final String? deliveryCharges;
  final String? notes;
  final AddEditAddressData? deliveryAddress;
  final List<OrderProductsData>? products;

  OrderHistoryData({
    this.orderId,
    this.status,
    this.totalAmount,
    this.uniqueOrderId,
    this.deliveryDate,
    this.isFastDelivery,
    this.deliveryCharges,
    this.notes,
    this.deliveryAddress,
    this.products,
  });

  OrderHistoryData.fromJson(Map<String, dynamic> json)
      : orderId = json['order_id'] as int?,
        status = json['status'] as String?,
        totalAmount = json['total_amount'] as String?,
        deliveryDate = json['delivery_date'] as String?,
        uniqueOrderId = json['unique_order_id'] as String?,
        isFastDelivery = json['is_fast_delivery'] as int?,
        deliveryCharges = json['delivery_charges'] as String?,
        notes = json['notes'] as String?,
        deliveryAddress = (json['delivery_address'] as Map<String,dynamic>?) != null ? AddEditAddressData.fromJson(json['delivery_address'] as Map<String,dynamic>) : null,
        products = (json['products'] as List?)?.map((dynamic e) => OrderProductsData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'order_id' : orderId,
    'status' : status,
    'total_amount' : totalAmount,
    'unique_order_id' : uniqueOrderId,
    'delivery_date' : deliveryDate,
    'is_fast_delivery' : isFastDelivery,
    'delivery_charges' : deliveryCharges,
    'notes' : notes,
    'delivery_address' : deliveryAddress?.toJson(),
    'products' : products?.map((e) => e.toJson()).toList()
  };
}



class OrderProductsData {
  final int? productId;
  final String? name;
  final int? amount;
  final int? quantity;
  final String? imageUrl;
  final List<String>? images;

  OrderProductsData({
    this.productId,
    this.name,
    this.amount,
    this.quantity,
    this.imageUrl,
    this.images,
  });

  OrderProductsData.fromJson(Map<String, dynamic> json)
      : productId = json['product_id'] as int?,
        name = json['name'] as String?,
        amount = json['amount'] as int?,
        quantity = json['quantity'] as int?,
        imageUrl = json['image_url'] as String?,
        images = (json['images'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'product_id' : productId,
    'name' : name,
    'amount' : amount,
    'quantity' : quantity,
    'image_url' : imageUrl,
    'images' : images
  };
}