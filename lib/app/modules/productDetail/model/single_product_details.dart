class SingleProductDetails {
  int? status;
  String? message;
  SingleProductDetailsData? data;

  SingleProductDetails({this.status, this.message, this.data});

  SingleProductDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new SingleProductDetailsData.fromJson(json['data']) : null;
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

class SingleProductDetailsData {
  int? productId;
  String? name;
  int? amount;
  dynamic discount;
  String? description;
  String? imageUrl;
  List<Images>? images;

  SingleProductDetailsData(
      {this.productId,
        this.name,
        this.amount,
        this.discount,
        this.description,
        this.imageUrl,
        this.images});

  SingleProductDetailsData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    amount = json['amount'];
    discount = json['discount'];
    description = json['description'];
    imageUrl = json['image_url'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  int? productId;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Images(
      {this.id,
        this.productId,
        this.imageUrl,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Images.fromJson(Map<String, dynamic> json) {
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
