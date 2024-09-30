class EditProduct {
  int? status;
  String? message;
  EditProductData? data;

  EditProduct({this.status, this.message, this.data});

  EditProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new EditProductData.fromJson(json['data']) : null;
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

class EditProductData {
  int? id;
  int? vendorId;
  int? categoryId;
  String? name;
  int? amount;
  int? discount;
  String? description;
  bool? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  EditProductData(
      {this.id,
        this.vendorId,
        this.categoryId,
        this.name,
        this.amount,
        this.discount,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  EditProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    categoryId = json['category_id'];
    name = json['name'];
    amount = json['amount'];
    discount = json['discount'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
