import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';


class GetQuote {
  int? status;
  String? message;
  List<GetQuoteData>? data;
  GetQuotePagination? pagination;

  GetQuote({this.status, this.message, this.data, this.pagination});

  GetQuote.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetQuoteData>[];
      json['data'].forEach((v) {
        data!.add(new GetQuoteData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new GetQuotePagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class GetQuoteData {
  int? quoteId;
  dynamic totalPrice;
  dynamic offerPrice;
  String? status;
  String? createdAt;
  RxBool? isCheck = false.obs;
  GetQuoteCustomer? customer;
  List<GetQuoteProducts>? products;

  GetQuoteData(
      {this.quoteId,
        this.totalPrice,
        this.offerPrice,
        this.status,
        this.createdAt,
        this.customer,
        this.isCheck,
        this.products});

  GetQuoteData.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id'];
    totalPrice = json['total_price'];
    offerPrice = json['offer_price'];
    status = json['status'];
    createdAt = json['created_at'];
    customer = json['customer'] != null
        ? new GetQuoteCustomer.fromJson(json['customer'])
        : null;
    if (json['products'] != null) {
      products = <GetQuoteProducts>[];
      json['products'].forEach((v) {
        products!.add(new GetQuoteProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quote_id'] = this.quoteId;
    data['total_price'] = this.totalPrice;
    data['offer_price'] = this.offerPrice;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetQuoteCustomer {
  String? name;
  String? email;
  String? address;
  String? city;
  String? country;

  GetQuoteCustomer({this.name, this.email, this.address, this.city, this.country});

  GetQuoteCustomer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    return data;
  }
}

class GetQuoteProducts {
  int? productId;
  String? name;
  int? amount;
  int? quantity;
  String? imageUrl;
  List<String>? images;

  GetQuoteProducts(
      {this.productId,
        this.name,
        this.amount,
        this.quantity,
        this.imageUrl,
        this.images});

  GetQuoteProducts.fromJson(Map<String, dynamic> json) {
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

class GetQuotePagination {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  String? page;

  GetQuotePagination(
      {this.total, this.perPage, this.currentPage, this.lastPage, this.page});

  GetQuotePagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['page'] = this.page;
    return data;
  }
}

