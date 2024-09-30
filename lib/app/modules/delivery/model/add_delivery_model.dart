class AddDeliveryModel {
  int? status;
  String? message;
  Data? data;

  AddDeliveryModel({this.status, this.message, this.data});

  AddDeliveryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? normalDeliveryDays;
  bool? isFastDelivery;
  int? fastDeliveryDays;
  int? fastDeliveryCharges;
  int? vendorId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.normalDeliveryDays,
        this.isFastDelivery,
        this.fastDeliveryDays,
        this.fastDeliveryCharges,
        this.vendorId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    normalDeliveryDays = json['normal_delivery_days'];
    isFastDelivery = json['is_fast_delivery'];
    fastDeliveryDays = json['fast_delivery_days'];
    fastDeliveryCharges = json['fast_delivery_charges'];
    vendorId = json['vendor_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['normal_delivery_days'] = this.normalDeliveryDays;
    data['is_fast_delivery'] = this.isFastDelivery;
    data['fast_delivery_days'] = this.fastDeliveryDays;
    data['fast_delivery_charges'] = this.fastDeliveryCharges;
    data['vendor_id'] = this.vendorId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
