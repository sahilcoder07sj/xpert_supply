import 'package:get/get.dart';
import 'package:tbd_flutter/app/modules/addEditAddress/model/add_edit_address_model.dart';
import 'package:tbd_flutter/app/modules/orderHistory/model/order_history_model.dart';

class QuoteHistoryModel {
  final int? status;
  final String? message;
  final List<QuoteHistoryData>? data;
  final Pagination? pagination;

  QuoteHistoryModel({
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  QuoteHistoryModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) =>
                QuoteHistoryData.fromJson(e as Map<String, dynamic>))
            .toList(),
        pagination = (json['pagination'] as Map<String, dynamic>?) != null
            ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
        'pagination': pagination?.toJson()
      };
}

class QuoteHistoryData {
  final int? quoteId;
   String? status;
  final dynamic message;
  final String? totalPrice;
  final String? offerPrice;
  final Vendor? vendor;
  final AddEditAddressData? address;
  RxBool? isCheck = false.obs;
  final List<OrderProductsData>? products;

  QuoteHistoryData({
    this.quoteId,
    this.status,
    this.message,
    this.totalPrice,
    this.offerPrice,
    this.isCheck,
    this.vendor,
    this.address,
    this.products,
  });

  QuoteHistoryData.fromJson(Map<String, dynamic> json)
      : quoteId = json['quote_id'] as int?,
        status = json['status'] as String?,
        message = json['message'],
        totalPrice = json['total_price'] as String?,
        offerPrice = json['offer_price'] as String?,
        vendor = (json['vendor'] as Map<String, dynamic>?) != null
            ? Vendor.fromJson(json['vendor'] as Map<String, dynamic>)
            : null,
        address = (json['address'] as Map<String, dynamic>?) != null
            ? AddEditAddressData.fromJson(
                json['address'] as Map<String, dynamic>)
            : null,
        products = (json['products'] as List?)
            ?.map((dynamic e) =>
                OrderProductsData.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'quote_id': quoteId,
        'status': status,
        'message': message,
        'total_price': totalPrice,
        'offer_price': offerPrice,
        'vendor': vendor?.toJson(),
        'address': address?.toJson(),
        'products': products?.map((e) => e.toJson()).toList()
      };
}

class Vendor {
  final int? vendorId;
  final String? name;
  final String? email;

  Vendor({
    this.vendorId,
    this.name,
    this.email,
  });

  Vendor.fromJson(Map<String, dynamic> json)
      : vendorId = json['vendor_id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?;

  Map<String, dynamic> toJson() => {
        'vendor_id': vendorId,
        'name': name,
        'email': email,
      };
}

class Pagination {
  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  Pagination({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
  });

  Pagination.fromJson(Map<String, dynamic> json)
      : total = json['total'] as int?,
        perPage = json['per_page'] as int?,
        currentPage = json['current_page'] as int?,
        lastPage = json['last_page'] as int?;

  Map<String, dynamic> toJson() => {
        'total': total,
        'per_page': perPage,
        'current_page': currentPage,
        'last_page': lastPage
      };
}
