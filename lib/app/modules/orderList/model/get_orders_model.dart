import 'package:tbd_flutter/app/data/all.dart';

class GetOrders {
  int? status;
  String? message;
  GetOrdersData? data;

  GetOrders({this.status, this.message, this.data});

  GetOrders.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new GetOrdersData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetOrdersData {
  int? totalOrders;
  List<Orders>? orders;

  GetOrdersData({this.totalOrders, this.orders});

  GetOrdersData.fromJson(Map<String, dynamic> json) {
    totalOrders = json['total_orders'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_orders'] = this.totalOrders;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? orderId;
  int? customerId;
  String? customerName;
  String? status;
  String? totalAmount;
  String? deliveryDate;
  int? isFastDelivery;
  String? deliveryCharges;
  String? notes;
  DeliveryAddress? deliveryAddress;
  List<Products>? products;
  RxBool isCheck = false.obs;

  Orders(
      {this.orderId,
        this.customerId,
        this.status,
        this.totalAmount,
        this.deliveryDate,
        this.customerName,
        this.isFastDelivery,
        this.deliveryCharges,
        this.notes,
        this.deliveryAddress,
        this.products,
        required this.isCheck,
      });

  Orders.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    status = json['status'];
    totalAmount = json['total_amount'];
    deliveryDate = json['delivery_date'];
    isFastDelivery = json['is_fast_delivery'];
    deliveryCharges = json['delivery_charges'];
    notes = json['notes'];
    deliveryAddress = json['delivery_address'] != null
        ? new DeliveryAddress.fromJson(json['delivery_address'])
        : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['status'] = this.status;
    data['total_amount'] = this.totalAmount;
    data['delivery_date'] = this.deliveryDate;
    data['is_fast_delivery'] = this.isFastDelivery;
    data['delivery_charges'] = this.deliveryCharges;
    data['notes'] = this.notes;
    if (this.deliveryAddress != null) {
      data['delivery_address'] = this.deliveryAddress!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryAddress {
  String? address;
  String? area;
  String? city;
  String? country;
  String? pincode;

  DeliveryAddress(
      {this.address, this.area, this.city, this.country, this.pincode});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    area = json['area'];
    city = json['city'];
    country = json['country'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['area'] = this.area;
    data['city'] = this.city;
    data['country'] = this.country;
    data['pincode'] = this.pincode;
    return data;
  }
}

class Products {
  int? productId;
  String? name;
  int? amount;
  int? quantity;
  String? imageUrl;
  List<String>? images;

  Products(
      {this.productId,
        this.name,
        this.amount,
        this.quantity,
        this.imageUrl,
        this.images});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    amount = json['amount'];
    quantity = json['quantity'];
    imageUrl = json['image_url'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['quantity'] = this.quantity;
    data['image_url'] = this.imageUrl;
    data['images'] = this.images;
    return data;
  }
}
