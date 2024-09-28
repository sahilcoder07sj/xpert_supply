import 'package:tbd_flutter/app/modules/vendor_list/model/product_list_model.dart';

class ProductListModel {
  final int? status;
  final String? message;
  final ProductListData? data;

  ProductListModel({
    this.status,
    this.message,
    this.data,
  });

  ProductListModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? ProductListData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class ProductListData {
  final String? categoryId;
  final List<ProductsData>? products;
  final int? total;
  final int? currentPage;
  final int? lastPage;
  final int? perPage;

  ProductListData({
    this.categoryId,
    this.products,
    this.total,
    this.currentPage,
    this.lastPage,
    this.perPage,
  });

  ProductListData.fromJson(Map<String, dynamic> json)
      : categoryId = json['category_id'] as String?,
        products = (json['products'] as List?)?.map((dynamic e) => ProductsData.fromJson(e as Map<String,dynamic>)).toList(),
        total = json['total'] as int?,
        currentPage = json['current_page'] as int?,
        lastPage = json['last_page'] as int?,
        perPage = json['per_page'] as int?;

  Map<String, dynamic> toJson() => {
    'category_id' : categoryId,
    'products' : products?.map((e) => e.toJson()).toList(),
    'total' : total,
    'current_page' : currentPage,
    'last_page' : lastPage,
    'per_page' : perPage
  };
}

class ImagesData {
  final int? id;
  final int? productId;
  final String? imageUrl;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  ImagesData({
    this.id,
    this.productId,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  ImagesData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        productId = json['product_id'] as int?,
        imageUrl = json['image_url'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'product_id' : productId,
    'image_url' : imageUrl,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'deleted_at' : deletedAt
  };
}