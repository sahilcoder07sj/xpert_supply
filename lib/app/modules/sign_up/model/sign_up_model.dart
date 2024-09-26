class SignUpModel {
  int? status;
  String? message;
  SignUpData? data;
  String? token;

  SignUpModel({this.status, this.message, this.data, this.token});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new SignUpData.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class SignUpData {
  String? businessName;
  String? name;
  String? email;
  String? password;
  String? vendorNo;
  String? deviceId;
  String? deviceToken;
  String? deviceType;
  String? updatedAt;
  String? createdAt;
  int? id;

  SignUpData(
      {this.businessName,
        this.name,
        this.email,
        this.password,
        this.vendorNo,
        this.deviceId,
        this.deviceToken,
        this.deviceType,
        this.updatedAt,
        this.createdAt,
        this.id});

  SignUpData.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    vendorNo = json['vendor_no'];
    deviceId = json['device_id'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_name'] = this.businessName;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['vendor_no'] = this.vendorNo;
    data['device_id'] = this.deviceId;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
