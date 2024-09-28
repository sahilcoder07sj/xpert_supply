
class AddEditAddressModel {
  final int? status;
  final String? message;
  final AddEditAddressData? data;

  AddEditAddressModel({
    this.status,
    this.message,
    this.data,
  });

  AddEditAddressModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? AddEditAddressData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class AddEditAddressData {
  final int? id;
  final int? customerId;
  final String? address;
  final String? area;
  final String? city;
  final String? country;
  final String? pincode;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  AddEditAddressData({
    this.id,
    this.customerId,
    this.address,
    this.area,
    this.city,
    this.country,
    this.pincode,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  AddEditAddressData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        customerId = json['customer_id'] as int?,
        address = json['address'] as String?,
        area = json['area'] as String?,
        city = json['city'] as String?,
        country = json['country'] as String?,
        pincode = json['pincode'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'customer_id' : customerId,
    'address' : address,
    'area' : area,
    'city' : city,
    'country' : country,
    'pincode' : pincode,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'deleted_at' : deletedAt
  };
}