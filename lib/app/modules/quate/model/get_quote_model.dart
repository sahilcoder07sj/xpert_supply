import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

/*class GetQuote {
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
  String? phoneNumber;
  String? address;
  String? city;
  String? country;

  QuoteCustomer({this.name, this.email, this.phoneNumber, this.address, this.city, this.country});

  QuoteCustomer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
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
}*/

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
  String? totalPrice;
  String? offerPrice;
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
  String? phoneNumber;
  String? address;
  String? city;
  String? country;

  GetQuoteCustomer(
      {this.name,
        this.email,
        this.phoneNumber,
        this.address,
        this.city,
        this.country});

  GetQuoteCustomer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    return data;
  }
}

class GetQuoteProducts {
  String? productName;
  int? productPrice;
  List<GetQuoteImages>? images;

  GetQuoteProducts({this.productName, this.productPrice, this.images});

  GetQuoteProducts.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productPrice = json['product_price'];
    if (json['images'] != null) {
      images = <GetQuoteImages>[];
      json['images'].forEach((v) {
        images!.add(new GetQuoteImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetQuoteImages {
  int? id;
  int? productId;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GetQuoteImages(
      {this.id,
        this.productId,
        this.imageUrl,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  GetQuoteImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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

