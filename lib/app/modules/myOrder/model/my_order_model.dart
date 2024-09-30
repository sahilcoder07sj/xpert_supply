class DeliveryModel {
  final int? status;
  final String? message;
  final DeliveryData? data;

  DeliveryModel({
    this.status,
    this.message,
    this.data,
  });

  DeliveryModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? DeliveryData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class DeliveryData {
  final int? id;
  final int? vendorId;
  final int? normalDeliveryDays;
  final bool? isFastDelivery;
  final int? fastDeliveryDays;
  final int? fastDeliveryCharges;
  final dynamic deletedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? normalDeliveryDate;
  final String? fastDeliveryDate;

  DeliveryData({
    this.id,
    this.vendorId,
    this.normalDeliveryDays,
    this.isFastDelivery,
    this.fastDeliveryDays,
    this.fastDeliveryCharges,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.normalDeliveryDate,
    this.fastDeliveryDate,
  });

  DeliveryData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        vendorId = json['vendor_id'] as int?,
        normalDeliveryDays = json['normal_delivery_days'] as int?,
        isFastDelivery = json['is_fast_delivery'] as bool?,
        fastDeliveryDays = json['fast_delivery_days'] as int?,
        fastDeliveryCharges = json['fast_delivery_charges'] as int?,
        deletedAt = json['deleted_at'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        normalDeliveryDate = json['normal_delivery_date'] as String?,
        fastDeliveryDate = json['fast_delivery_date'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'vendor_id' : vendorId,
    'normal_delivery_days' : normalDeliveryDays,
    'is_fast_delivery' : isFastDelivery,
    'fast_delivery_days' : fastDeliveryDays,
    'fast_delivery_charges' : fastDeliveryCharges,
    'deleted_at' : deletedAt,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'normal_delivery_date' : normalDeliveryDate,
    'fast_delivery_date' : fastDeliveryDate
  };
}