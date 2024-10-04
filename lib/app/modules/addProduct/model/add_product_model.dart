class AddProduct {
  int? status;
  String? message;
  AddProductData? data;

  AddProduct({this.status, this.message, this.data});

  AddProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new AddProductData.fromJson(json['data']) : null;
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

class AddProductData {
  int? vendorId;
  int? categoryId;
  String? name;
  int? amount;
  dynamic discount;
  String? description;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddProductData(
      {this.vendorId,
        this.categoryId,
        this.name,
        this.amount,
        this.discount,
        this.description,
        this.updatedAt,
        this.createdAt,
        this.id});

  AddProductData.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendor_id'];
    categoryId = json['category_id'];
    name = json['name'];
    amount = json['amount'];
    discount = json['discount'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_id'] = this.vendorId;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
