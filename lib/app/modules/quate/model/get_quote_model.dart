import 'package:get/get.dart';

class GetQuote {
  int? status;
  String? message;
  List<QuoteData>? data;
  QuotePagination? pagination;

  GetQuote({this.status, this.message, this.data, this.pagination});

  GetQuote.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <QuoteData>[];
      json['data'].forEach((v) {
        data!.add(new QuoteData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new QuotePagination.fromJson(json['pagination'])
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

class QuoteData {
  int? quoteId;
  QuoteCustomer? customer;
  String? status;
  String? totalPrice;
  String? offerPrice;
  String? createdAt;
  RxBool? isCheck = false.obs;
  List<QuoteProducts>? products;

  QuoteData(
      {this.quoteId,
        this.customer,
        this.status,
        this.totalPrice,
        this.offerPrice,
        this.createdAt,
        this.isCheck,
        this.products});

  QuoteData.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id'];
    customer = json['customer'] != null
        ? new QuoteCustomer.fromJson(json['customer'])
        : null;
    status = json['status'];
    totalPrice = json['total_price'];
    offerPrice = json['offer_price'];
    createdAt = json['created_at'];
    if (json['products'] != null) {
      products = <QuoteProducts>[];
      json['products'].forEach((v) {
        products!.add(new QuoteProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quote_id'] = this.quoteId;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['status'] = this.status;
    data['total_price'] = this.totalPrice;
    data['offer_price'] = this.offerPrice;
    data['created_at'] = this.createdAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuoteCustomer {
  String? name;
  String? email;

  QuoteCustomer({this.name, this.email});

  QuoteCustomer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}

class QuoteProducts {
  int? productId;
  String? name;
  int? quantity;
  int? price;
  String? imageUrl;

  QuoteProducts(
      {this.productId, this.name, this.quantity, this.price, this.imageUrl});

  QuoteProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class QuotePagination {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  String? page;

  QuotePagination(
      {this.total, this.perPage, this.currentPage, this.lastPage, this.page});

  QuotePagination.fromJson(Map<String, dynamic> json) {
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
