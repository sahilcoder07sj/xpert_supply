class GetCategory {
  int? status;
  List<GetCategoryData>? data;

  GetCategory({this.status, this.data});

  GetCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <GetCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new GetCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetCategoryData {
  int? id;
  String? name;
  bool? status;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GetCategoryData(
      {this.id,
        this.name,
        this.status,
        this.vendorId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  GetCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    vendorId = json['vendor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['vendor_id'] = this.vendorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
