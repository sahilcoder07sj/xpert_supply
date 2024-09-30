class AddCategory {
  int? status;
  String? message;
  AddCategoryData? data;

  AddCategory({this.status, this.message, this.data});

  AddCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new AddCategoryData.fromJson(json['data']) : null;
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

class AddCategoryData {
  String? name;
  int? vendorId;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddCategoryData({this.name, this.vendorId, this.updatedAt, this.createdAt, this.id});

  AddCategoryData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    vendorId = json['vendor_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['vendor_id'] = this.vendorId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
