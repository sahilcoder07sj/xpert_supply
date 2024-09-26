class LoginUserModel {
  final int? status;
  final String? message;
  final LoginUserData? data;
  final String? token;

  LoginUserModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  LoginUserModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? LoginUserData.fromJson(json['data'] as Map<String,dynamic>) : null,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson(),
    'token' : token
  };
}

class LoginUserData {
  final String? name;
  final String? email;
  final String? vendorNo;
  final String? deviceId;
  final String? deviceToken;
  final String? deviceType;
  final String? updatedAt;
  final String? createdAt;
  final String? password;
  final String? rememberToken;
  final String? deleteReason;
  final String? emailVerifiedAt;
  final String? deletedAt;
  final String? businessName;
  final int? id;

  LoginUserData({
    this.name,
    this.email,
    this.deviceId,
    this.deviceToken,
    this.emailVerifiedAt,
    this.deviceType,
    this.deleteReason,
    this.vendorNo,
    this.rememberToken,
    this.password,
    this.businessName,
    this.updatedAt,
    this.createdAt,
    this.deletedAt,
    this.id,
  });

  LoginUserData.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        email = json['email'] as String?,
        vendorNo = json['vendor_no'] as String?,
        deviceId = json['device_id'] as String?,
        emailVerifiedAt = json['email_verified_at'] as String?,
        deviceToken = json['device_token'] as String?,
        deleteReason = json['delete_reason'] as String?,
        businessName = json['business_name'] as String?,
        deviceType = json['device_type'] as String?,
        password = json['password'] as String?,
        updatedAt = json['updated_at'] as String?,
        rememberToken = json['remember_token'] as String?,
        createdAt = json['created_at'] as String?,
        deletedAt = json['deleted_at'] as String?,
        id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'vendor_no' : vendorNo,
    'email' : email,
    'device_id' : deviceId,
    'device_token' : deviceToken,
    'delete_reason' : deleteReason,
    'device_type' : deviceType,
    'email_verified_at' : emailVerifiedAt,
    'password' : password,
    'remember_token' : rememberToken,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'business_name' : businessName,
    'deleted_at' : deletedAt,
    'id' : id
  };
}