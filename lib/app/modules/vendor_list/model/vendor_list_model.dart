class VendorListModel {
  final int? status;
  final String? message;
  final List<VendorListData>? data;

  VendorListModel({
    this.status,
    this.message,
    this.data,
  });

  VendorListModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => VendorListData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class VendorListData {
  final int? id;
  final int? customerId;
  final int? vendorId;
  final String? vendorNo;
  final String? createdAt;
  final String? name;
  final String? updatedAt;

  VendorListData({
    this.id,
    this.customerId,
    this.vendorId,
    this.vendorNo,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  VendorListData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        customerId = json['customer_id'] as int?,
        vendorId = json['vendor_id'] as int?,
        vendorNo = json['vendor_no'] as String?,
        name = json['name'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'customer_id' : customerId,
    'vendor_id' : vendorId,
    'vendor_no' : vendorNo,
    'name' : name,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}